import UIKit

/*
            __   __
           __ \ / __
          /  \ | /  \
              \|/                           Mobgeek
         _,.---v---._
/\__/\  /             \             Curso Swift em 4 semanas
\_  _/ /               \
  \ \_|           @  __|
    \                \_
     \     ,__/       /
   ~~~`~~~~~~~~~~~~~~/~~~~

*/
/*:
# Aula 03

# Tecnologias de iOS - Frameworks

**Framework** é um conjunto de funcionalidades e recursos que podem ser usados por uma aplicação em iOS ou OSX. Cada Framework da linguagem já fornce inúmeros métodos e propriedes prontos para que você possa utailizá-los na sua aplicação. Se você, por exemplo, quer trabalhar com localização do usuário pode usar o framework Core Location, para processamento de imagem o Core Image, para sensores ainda temos o Core Motion, dentro muitos outros.

O Sistema operacional da Apple para dipositivos móveis (iOS) é divido em 4 camadas onde cada uma agrupa diferentes tipos de frameworks:

- **Cocoa Touch:** Frameworks dessa camada definem a aparência do seu App. Aqui temos o UIKit, por exemplo.
- **Media:** Aqui encontramos frameworks usados para trablhar com Audio, Vídeo, Imagem.Como exemplo temos o Core Audio, Core Image, ...
- **Core Services:** Aqui estão oncentrados os servições fundamentaris do sistema iOS como acesso a banco de dados e persistencia pelo Core Data, saber localização do usuário pelo Core Location, ...
- **Core OS:** Esse é o nível mais baixo que contém tecnlogias para lidar com o Bluetooth, comunição com accessórios externos ligados ao iOS, segurança, ...

- Para mais informações sobre teclogias de iOS acessar: [Tecnologias de iOS](https://developer.apple.com/library/ios/documentation/Miscellaneous/Conceptual/iPhoneOSTechOverview/CoreOSLayer/CoreOSLayer.html#//apple_ref/doc/uid/TP40007898-CH11-SW1)

---

# UIKit Framework

Para os próximos exemplos falaremos sobre um framework específico da camada Cocoa Touch chamado UIKit. Ele contém diversos tipos que nos permitem criar interfaces gráficas para o usuário em iOS.

## **CGRect**
Este é um tipo que está dentro do UIKit, dentre outros que serão mostrados em seguida, usado para criar medidas para uma view (tela - área retangular) no código. Vamos então criar as medidas para depois falar da view.

Aqui criamos uma medida fornecendo as coordendas (lembrando plano cartesiano da matemática) junto do tamanho e largura. Os parâmetros x e y vão representar as cordenadas enquanto os parâmetros width e height ficam encarregados da largura e altura.

*Parâmetros nada mais são do que valores que iremos passar para construir o valor de um tipo mais complexo como o CGRect.
*/
var medidas = CGRect(x: 0, y: 0, width: 400, height: 400)
/*:
## **UIView**
Agora vamos utilizar o tipo UIView para criar uma view fornecendo como parâmetro a medido que criamos acima
*/
var view = UIView(frame: medidas)
/*:
## **UIColor**
Vamos dar um cor de fundo a nossa view usando uma propriedade de UIView chamada backgroundColor e dar uma cor laranja a ela usando um método de UIColor.


*Propriedades e Métodos são características e funcionalidades associadas a tipos que nos permitem fazer certas operações sobre os valores desse tipo.
*/
view.backgroundColor = UIColor.orangeColor()
/*:
## **UIImage**
Tipo usado para representar uma imagem no código. Vamos fornecer a ele um parâmetro que é um arquivo de imagem. Use command + 1 para ver os arquivos associados a esse arquivo Playgorund dentro da pasta Resources vocês podem encontrar a imagem que importamos.
*/
let imagem = UIImage(named: "bebe.jpg")
/*: 
## **UIImageView**
Usada para criar uma view reponsável apenas por apresentar imagens. Vamos criá-la com a mesma largura e altura da imagem importada.
*/
let cenaParaImagens = UIImageView(frame: CGRect(x: 60, y: 0, width: 279, height: 411))
//: Aqui vamos colocar a imagem no imageview que criamos usando a propriedade 'image' de UIImageView
cenaParaImagens.image = imagem
//: Agora nós vamos utilizar um método de UIView, o addSubView, para adicionar uma view secundária (no caso, uma UIImageView) sobre uma view primária (UIView). Lembram que ao criarmos um UIImageView fornecemos o valor 60 para x? Fizemos isso para deslocar a imagem do bebê pelo cena primário do View, colocando ele mais ao centro, experimentem colocar para 30-40 veja se não vai ficar mais a esquerda.
view.addSubview(cenaParaImagens)
/*:
Para mais detalhes sobre as propriedades e métodos de todos os tipo do UIKit acessar: [UIKit Framework Reference](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/#classes)

---

# Optionals
Um conceito muito útil em Swift é o de Optionals. Com elas vamos poder dizer que uma variável ou constante pode ou não ter valor associado, ou seja, representar ausência de valor. Isso pode ser útil em diversas situações como por exemplo dizer que uma pessoa pode ou não ter um celular, ou tentar importar uma imagem que não existe e representar facilmente sua inexistência. Com Optionals, representaremos a ausência de valor com o termo 'nil'.

Para o nosso exemplo, vamos dizer que você quer construir uma agênda telefônica e nela existirão os seguintes campos: 'nome', 'telFixo', 'celular'.
Sendo que uma pessoa pode fornecer ou não um número de celular
*/
var nome = "Renan"
var telFixo = "2674-7768"
//: Aqui iremos definir 'celular' como opcional, faremos isso colocando simplesmente um ponto de interrogação (?) após o tipo da variável. Caso não seja fornecido um valor inicial a ela, Swift irá inicializar a opcional com o valor 'nil', indicando que está vazia.
var celular: String? = "98856-3288"
//: Vamos dizer que Renan resolveu comprar um celular, vamos então armazenar o número desse novo celular na opcional acima.
celular = "98845-6789"
//: Um belo dia ele tem seu celular roubado, como seu número de celular foi perdido, vamos dizer que ele não existe mais
celular = nil
//: Após alguns meses ele consegue dinheiro para comprar um celular e então é fornecido um novo número à variável =)
celular = "9948596970"
/*:
## **Forced Unwrapping**

Acabmos de ver como definir tipos opcionais e criar varíaveis ou contantes que armazenam valores desse tipo. Vamos ver agora como podemos acessar seus valores de forma segura.

A primeira opção é conhecida como forçar o desempacotamente. Imagine uma opcional como uma caixa que contém um valor, nós queremos primeiro saber se existe valor dentro dessa caixa para depois extrair esse valor e trabalhar com ele. Se em algum momento do código nós tentarmos usar um valor que não existe, será gerado um erro, por isso fazemos uma verifição. Nós iremos forçar o desempacotamente colocando um ponto de exclamanção após o nome da variável ou constante.
*/
celular!
//: Para verificar se uma opcional possui ou não valor basta compará-la a 'nil'. Abaixo podemos ler: "Se celular for diferente de nil, ou seja, possuir valor, desempacote esse valor e apresente ele na String"
if celular != nil {
    
    "O segundo celular do \(nome) é \(celular!)"
    
}
/*: 
## **Optional Binding**

Uma outra forma ainda mais segura e recomendada é usar uma constante para armazernar o valor da opcional temporariamente, tirando a necessidade de se usar o ponto de exclamação (!). Podemos ler a condição abaixo da seguinte forma: "Se celular possuir valor, desempacote esse valor e atribua-o à constante celularTemp".
*/
if let celularTemp = celular {
    
    "O segundo celular do Ale é \(celularTemp)"

}
//: Optionals são tão importantes em Swift que a própria Apple usa esse conceito em seus frameworks, um exemplo é no 'UIKit', no tipo 'UIImage', quando importamos uma imagem. Se vocês usarem "option + click" em cima do nome da constante abaixo, vocês vão ver que ela é do tipo UIImage? (UIImage opcional). Isso é feito porque há a possibilidade de ser informado o nome errado da imagem ou a imagem não existir no arquivo, nesse caso precisamos representar a ausência de imagem.
let algumaImagem = UIImage(named: "bebe.jpg")
//: Quer ver só como funciona? Vamos tentar importar uma imagem que não existe. Vejam só e não é retornado nil.
let imagemInexistente = UIImage(named: "bebê.jpg")
/*: 
# Tipos de Coleções (Collection Types)

Até agora vimos como podemos armazenar um único valor em uma constante ou variável. Agora veremos como em uma mesma variável ou constante podemos armazenar mais de uma valor.

## **Array**
O primeiro tipo que temos para isso em Swift, é o tipo Array, que nada mais é do que uma coleção de valores do mesmo tipo ordenados. Abaixo, Swift infere que 'listaDeCompras' é do tipo '[String]', ou seja, uma Array de Strings.
*/
var listaDeCompras = ["Laranja","Leite","Ovos"]
//: Para acessar e modifiar valore sem um Array podemos usar índices partindo do 0. Embaixo dizemos que queremos acessar o valor na primeira posição da Array e trocar esse valor por "Biscoito"
listaDeCompras[0] = "Biscoito"
//:Também podemos usar um método de Array chamado .append() para adicionar um item ao final da Array.
listaDeCompras.append("Ervilha")
//:Existem também mais 2 métodos que removem o último elemento ou o elemento de uma posição específica
listaDeCompras.removeLast()

listaDeCompras.removeAtIndex(1)
//:Temos uma propriedade de Array que verifica se ela está vazia e uma outra que conta a quantidade de elementos dela
listaDeCompras.isEmpty

listaDeCompras.count
//:Ainda tem mais! Podemos percorrer os elementos de uma Array usando o Loop for-in.
for elemento in listaDeCompras {
    
    "Preciso comprar \(elemento)"
    
}
/*: 
## **Dictionary**
São um segundo tipo de Swift para armazenar uma coleção de duplas de valores (chave:valor). Diferente das Arrays, dicionários são coleções desordenadas, por isso que precisaremos acessar seus elementos através das chaves que são uma forma única de buscar por um valor no dicionário.

Aqui vamos criar um dicionário que armazena o ID de uma pessoa com o seu respectivo nome em uma determinada empresa. Swift irá inferir que 'registroFuncionários' é do tipo '[Int:String]', ou seja, um dicionário que possui chaves do tipo Int com valores associados do tipo String.
*/
var registroFuncionários = [1:"Mariana", 2:"Ale", 3: "Isabela"]
//:Para acessar esses valores vamos sempre informar a chave, que será retornado o valor correspondente a ela.
registroFuncionários[2]
//: Se informarmos uma chave que não existe será retornado 'nil', pois o retorno de uma chave no dicionário é sempre um valor opcional, justamente para dizer que a chave não existe
registroFuncionários[4]
//: :Para adicionar uma nova chave com seu respectivo valor, vamos informar a nova chave atruindo um valor a ela.
registroFuncionários[4] = "Renã"
//: Caso a chave já exista, o valor será sobreescrito.
registroFuncionários[4] = "Renan"
//: E se quisermos exluir uma chave junto de seu valor no' dicionário basta atribuir 'nil' a ela.
registroFuncionários[4] = nil
/*: 
Temos 2 formas de percorrer os valores em um dicionário

A primeira é se utlizar de 2 constantes sendo uma para ir percorrendo as chaves e outra seus valores.
*/
for (id,nome) in registroFuncionários {
    
    "\(nome) possui o identificador \(id)"
    
}
//:E uma outra se estivermos apenas interessados em percorrer as chaves ou apenas os valores do dicionário podemos usar 2 propriedades do tipo Dictionary para isso.
for (id) in registroFuncionários.keys {
    
    "\(id)"
    
}

for (nome) in registroFuncionários.values {
    
    "\(nome)"
    
}
/*:
Para uma lista com mais métodos e propriedades de Array e Dicionários acessar a [biblioteca padrão de Swift](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/)

---

# Core Image
Vamos falar agora de um framework da camada de Media usado para trabalhar com processamento de imagem.

## **CIImage**
Assim como o UIKit, o Core Image possui vários tipos que podemos usar para trabalhar com imagens e criar filtros. Vamos primeiro falar do tipo CIImage, com esse tipo podemos preparar uma imagem do tipo UIImage para que seja possível aplicar um filtro sobre ela.

Abaixo vamos passar a imagem que criamos lá em cima do tipo UIImage como parâmetro para construir um valor do tipo CIImage.
*/
let novaImagem = CIImage(image: imagem)
/*: 
## **CIFilter**
Agora que já temos a imagem preparado para passar pelo filtro, vamos criar esse filtro. A Apple disponibiliza pelo Core Image cerca de 160 filtros que podemos aplicar em imagens no iOS. Para o exemplo abaixo vamos utilizar um filtro chamado CISepiaTone.

Para criar um filtro precisaremos passar 2 tipos de parâmetros para CIFilter, primeiro o nome do filtro que consta na documentação da Apple (link mais ao final), segundo um dicionário no qual forneceremos os ajustes do filtro, esses ajustes variam de filtro para filtro, no caso do CISepiaTone existem 2 ajustes para passarmos: uma imagem do tipo CIImage que já criamos e a intensidade com a qual queremos aplicar esse filtro do tipo Double. Vamos lá!
*/
let filtro = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage": novaImagem, "inputIntensity": 1.0])
//: Por fim, vamos extrair a imagem gerada pelo filtro. Basta usar uma propriedade de CIFilter chamada 'outputImage' para visuzalizar a imagem.
filtro.outputImage
/*: 
Para uma lista completa de todos os filtros disponibilizados tanto para iOS quanto OSX, com informações do que cada um faz e quais parâmetros são necessários para usá-los, acessar: Core Image [Filters Reference](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html)

Se também quiserem saber mais sobre propriedades e métodos de CIFilter aqui vai o link: [CIFilter Class Reference](https://developer.apple.com/library/prerelease/ios/documentation/GraphicsImaging/Reference/QuartzCoreFramework/Classes/CIFilter_Class/index.html)

E para qualquer outro framework ou tipo de Swift que você queira ler a domcumentação, basta digitar no google o nome dele seguido de Reference, exemplo: UIImage reference, CIImage reference, ...
*/
