//
//  Modelo.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import Foundation
import Parse

///O modelo de dados da aplicações é um dicionário com *chaves* que vão representar as Categorias e *valores* que são uma Array de Tuplas para representar a pergunta, que é composta de tílulo + subtítulo, um arquivo que ao longo do código vamos converter para NSData, e a extensão desse arquivo, pois uma vez que uma arquivo se torna NSData não temos mais como verificar sua extensão.

///Logo temos um relacionamento do tipo:
      ///Uma única categoria pode ter várias perguntas (titulo + subtitulo) e respostas (arquivo + ext)
      ///Uma única pergunta vai ter apenas uma única resposta associda e vice-versa

///O medelo seria [String: [(String,String): NSData]], mas tuplas não podem ser usadas como chaves pois não adotam o protocolo Hashable


var dicionário:[String:[ (title:String, subtitle:String, file:PFFile, fileExt: String) ]] = [:]


///Motivos pelos quais armazenar o arquivo no modelo como PFFile ao invés de NSData:

/// - Ao atualizar o modelo de dados, é mais rápido armazenar uma instância de PFFile do que NSData.

/// - Não ficaremos carregando o conteúdo do arquivo por toda a aplicação, apenas "desempacotando-o" de PFFile no FileWebView. PFFile guarda uma referência para um arquivo que está no servidor do Parse até que seja usado o método getData()! para sincronizar os dados com a LDS, a partir desse momento qualquer getData()! pode ser usado sem conexão com a internet.



