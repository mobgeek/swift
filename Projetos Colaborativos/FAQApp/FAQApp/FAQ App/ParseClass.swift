//
//  ParseFile.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 08/07/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import Foundation
import Parse

///Classe customizada que contém métodos com a intenção de separar o código que lida com Parse do código que lida com as views. Quem vai utilizar bastante dessa classe é a CategoryTableViewController por causa do refresh de dados e etc...

class ParseClass {
    
    //MARK: - Constants & Variables
    
    //Criando as consultas, uma que será *online e outra sempre *offline
    
    //Def. de *Online -> Servidor do Parse / Tabela online / Dados no site
    //Def. de *Offline -> Dados armazenados localmente / No dispositivo / Local Datastore (LDS)
    
    //O className está diferente pois iremos criar PFObjects especialmente para a Local Datastore chamados *DadosLocais* evitando conflito com o objeto *Dados* que está online
    
    var onlineQuery = PFQuery(className: "Dados")
    var offlineQuery = PFQuery(className: "DadosLocais").fromLocalDatastore()
    
    //MARK: - Custom Methods
    
    ///Compara os dados locais com os dados online para ver se houve mudança na tabela no site do Parse, além de verificar se há campos em branco (nulos) na tabela
    
    func checkForNewData() -> [PFObject]? {
        
// PFObject -----> An Array of NSDictionary of NSString -> PFFieldOperation
//
// Sempre que estivermos falando sobre um único PFObject, estamos nos referindo a uma linha da tabela do Parse onde os nomes das colunas são as chaves e os valores são os campos referentes a cada colunda dessa linha. Abaixo temos um print de uma instância de PFObject mostrada no console ao dar um print() em uma instância do tipo PFObject
        
        
// <Dados: 0x156bacc0, objectId: 8RaCjRNrze, localId: (null)> {
//     category = "Sobre a Linguagem";
//      file = "<PFFile: 0x156bc160>";
//      questionBeginning = "Apresenta\U00e7\U00e3o de algumas caracter\U00edsticas da nossa amada linguagem Swift :)";
//      title = "Caracter\U00edsticas";
// }
        
        
        //Caso não haja campos vazios, armazena na constante temporária objetosOn os objetos da busca online, continuando o fluxo de execução do método
        
        guard let objetosOn = checkForNilFields() else {
            
            return nil   //Existem campos vazios na tabela
            
        }
        
        //Armazenando o(s) objeto(s) contido(s) localmente, em uma constante (Pense em cada objeto como sendo uma linha da tabela)
        
        var objetosOff = offlineQuery.findObjects()! as! [PFObject]
        
        //Se foi acrescentada ou retirada alguma linha na tabela online, já retorna os objetos da busca online. Para isso basta comaprar o total de elementos de cada um
        
        if objetosOn.count != objetosOff.count {
            
            return objetosOn
            
        }
        
        //Para tornar a comparação mais legível no código, estamos decompondo os valores de objetosOff e objetosOn e depois os reagrupando em arrays distintas
        
        var arrayOff: [String] = []
        var arrayOn: [String] = []
        
        for i in 0..<objetosOff.count {   //poderia ser objetosOn.count, tanto faz!
            
            //Quando se trata dos arquivos da coluna file, é mais eficiente comparar se houve alteração do path (que é único e sempre alterado quando um arquivo é armazenado no Parse) dele retornado pela propriedade name do que comparar uma string de dados do NSData. A única desvantagem é que se subirmos os mesmos arquivos sem alterar seu conteúdo, será disparado o alerta indicando que houve alterações, pois o path mudou, mas na verdade só subimos o arquivo novamente sem alteração de conteúdo.
            
            //Ai temos 2 opções: sacrifiamos eficiência e mostramos os alertas de forma pertinente, ou deixamos as comparações mais eficientes e ignoramos a confiabilidade das informações apresentadas ao usuário?
            
            //Resumindo, PFFile.name é mais rápido que PFFile.getData()!
            
            arrayOff.append(objetosOff[i].valueForKey("category") as! String)
            arrayOff.append((objetosOff[i].valueForKey("file") as! PFFile).name)
            arrayOff.append(objetosOff[i].valueForKey("questionBeginning") as! String)
            arrayOff.append(objetosOff[i].valueForKey("title") as! String)
            
            arrayOn.append(objetosOn[i].valueForKey("category") as! String)
            arrayOn.append((objetosOn[i].valueForKey("file") as! PFFile).name)
            arrayOn.append(objetosOn[i].valueForKey("questionBeginning") as! String)
            arrayOn.append(objetosOn[i].valueForKey("title") as! String)
            
        }
        
        //Ordenando as Arrays que contém os dados de cada busca
        
        let sortOff = arrayOff.sort(>)
        let sortOn = arrayOn.sort(>)
        
        //Se os objetos offline forem diferentes dos que estão online, e vice-versa, quer dizer que houve alteração no Parse.
        
        if sortOff != sortOn {
            
            //Retorna os objetos para atualzar a localDataStore
            return objetosOn
            
        }
        
        return nil   //Significa que os dados não mudaram
        
    }
    
    ///Busca por campos em branco (nulos) na tabela do Parse, retornando nil em caso de existirem
    
    func checkForNilFields() -> [PFObject]? {
        
        //Armazena o(s) objeto(s) da busca online, em uma constante
        
        let objects = onlineQuery.findObjects()! as! [PFObject]
        
        //Para cada objeto será verificado se ele retorna (1) nil ou se possuem o valor de (2) "", caso alguma vez pelo menos um deles retorne nil ou tenham o valor "", sai do método indicando que existe(m) campo(s) vazio(s).
        
        for object in objects {
            
            //(1)
            guard let x = object["category"] as? String,
                y = object["questionBeginning"] as? String,
                w = object["title"] as? String,
                z = object["file"] as? PFFile
                
                where   //(2) //testa se os valores desempacotados são "", que também indicam campos em branco
                
                x != "" && y != "" && w != "" && z != ""
                
                else  { return nil }
        }
        
        //Retorna os objetos da busca online caso não seja encontrado campos vazios
        return objects
        
    }
    
    ///Atualiza as informações do dicionário que está sendo usado como modelo na aplicação
    
    func updateModel() {
        
        //Armazenando o(s) objeto(s) contido(s) localmente, em uma constante
        
        let offlineObjects = offlineQuery.findObjects()! as! [PFObject]
        
        //Esvaziando o dicionário para não acontecer algo do tipo: Já ter nele a chave *Class* e online for mudadoaa categoria para *Classe*, e agora o dicionário conter ambos como chaves.
        
        dicionário = [:]
        
        //(1) Percorrendo o(s) objeto(s) contidos localmente, (2) para decompor seus dados e (3) ir atualizando o modelo de dados da aplicação
        
        //(1)
        for object in offlineObjects {
            
            //(2)
            let category = object["category"] as! String
            let subtitle = object["questionBeginning"] as! String
            let title = object["title"] as! String
            let file = object["file"] as! PFFile
            
            //(3)
            //Se não tiver a categoria em questão como chave do dicionário, cria ela e atribui os valores correspondentes
            
            if dicionário[category] == nil {
                
                dicionário[category] = [(title: title, subtitle: subtitle,file: file, fileExt: file.name.pathExtension)]
                
            } else {   //Se já existir, acrescenta mais uma tupla a array correpondente a categoria em questão
                
                dicionário[category]!.append(title: title, subtitle: subtitle,file: file, fileExt: file.name.pathExtension)
                
            }
            
        }
        
    }
    
    ///Copia localmente os objetos da busca online fornecendo a eles um className diferente.
    
    func copyLocally(onlineObjects: [PFObject])  {
    
//findObjects() é um método que funciona de forma *síncrona*, ou seja, se está sendo feita uma busca com ele em uma consulta (query) de className "Dados" e ela não está "setada" para o Local Datastore, todas as instâncias de PFObject com esse mesmo className serão modificadas. Logo, fornecendo um className diferente para as consultas offline, não havará esse problema.
//O que estava ocorrendo era que estavamos usando o mesmo className ("Dados") tanto para a query online quanto para a query offline, com isso, quando era chamado o método findObjects() todas as instâncias retornadas pela offlineQuery quanto pela onlineQuery eram iguais. Veja o exemplo abaixo:

//Antes: Usando className iguais ("Dados" tanto p/ onlineQuery quanto offlineQuery)

//Ex1.: offlineQuery.findObject()!   (2 objetos foram retornados)
//      Dados --> [category:optionals] / Dados --> [category: variables]

//      onlineQuery.findObject()!    (3 objetos foram retornados)
//      Dados --> [category:optionals] / Dados --> [category: variables] / Dados --> [category: control flow]

//      offlineQuery.findObjects()!   (3 objetos foram retornados)
//      Dados --> [category:optionals] / Dados --> [category: variables] / Dados --> [category: control flow]

//Isso ocorre pois findObjects()! vai buscar os dados verificando seu classesName, e como "Dados" é usado pelas 2 consultas, há essa *sobrescrita dos dados*. Resumindo, todas as instâncias de PFObject que possuem className igual a "Dados" serão atualizadas.,


//Agora: Usando className diferentes("Dados" p/ onlineQuery e "DadosLocais p/ offlineQuery")

//Ex2.: offlineQuery.findObject()!   (2 objetos foram retornados)
//      DadosLocais --> [category:optionals] / DadosLocais --> [category: variables]

//      onlineQuery.findObject()!    (3 objetos foram retornados)
//      Dados --> [category:optionals] / Dados --> [category: variables] / Dados --> [category: control flow]

//      offlineQuery.findObjects()!   (2 objetos foram retornados)
//      DadosLocais --> [category:optionals] / DadosLocais --> [category: variables]

//Agora ao chamar findObjects()! ele vai retornar os dados pertinentes à LDS


//Só precisamos agora tomar mais um cuidado, os objetos que vamos armazenar no LDS precisam ter o className "DadosLocais", e os dados retornados pela onlineQuery possuem o className "Dados", então não podemos simplesmente chegar e dar um pinAll() nesses objetos online, pois estariam com o className "Dados" na LDS. O que vamos fazer então é copiar os resultados da busca online em um Array de PFObjects fornecendo o className "DadosLocais" a eles.
        
        var objs: [PFObject] = []
        
        for i in 0..<onlineObjects.count {
            
            objs.append(PFObject(className: "DadosLocais"))
            
            objs[i]["category"] = onlineObjects[i].valueForKey("category") as! String
            objs[i]["title"] = onlineObjects[i].valueForKey("title") as! String
            objs[i]["questionBeginning"] = onlineObjects[i].valueForKey("questionBeginning") as! String
            objs[i]["file"] = onlineObjects[i].valueForKey("file") as! PFFile
        }
        
        //Aqui que realmente os objetos são armazenados localmente com o className "DadosLocais" ;)
        
        PFObject.pinAll(objs)
        
    }
    
}