// Playground - noun: a place where people can play

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
# Aula 01
## **Constantes & Variáveis**
Como podemos guardar valores e nos referir a eles mais tarde no código? Fazemos isso através das constantes e variáveis, que nada mais são do que nomes que criamos para armazenar um valor de um determinado tipo (Int, Double, String, Bool, ...) e chamar esse valor durante o código. Constantes têm a característica de guardar valores imutáveis, ou seja, uma vez atribuido um valor a elas, esse valor não pode ser mais alterado. Já as variáveis, como o próprio nome já diz, armazenam valores que podem variar com o tempo.

Vamos ver a forma como declaramos uma constante em Swift e atribuir um valor a ela.
*/

let corredor = "João"   //Estamos atribuindo à constante corredor um valor do tipo String

//: Vamos tentar alterar o seu valor. Veja que não será possível, pois estamos trabalhando com uma constante

//corredor = "Ana"   //Erro

//: Agora iremos declarar uma variável, atribuir um valor a ela e em seguida tentar alterar seu valor.

var distanciaPercorrida = 5

//: Perceba que foi possível alterar o valor de distanciaPercorrida, pois ela foi declarada como variável

distanciaPercorrida = 10

/*:
## **Tipos Nativos & Inferência de Tipo**
Tipos de dados são uma forma de dividir os dados (números, texto, imagem, ...) em grupos que facilitem ao computador identificar e trabalhar com eles.

Vamos explorar alguns tipos já fornecidos por Swift, os chamados tipos nativos, e também ver como Swift é capaz de advinhar o tipo de uma constante ou variável no momento da atribuição de um valor.
*/
/*:
### **Int**
Números inteiros positivos ou negativos
*/

var idade = 18  //Option + click p/ saber o tipo
idade = 20

/*:
### **Double**
Números com casas decimais positivos ou negativos
*/

var altura = 1.83
altura = 1.95

/*:
### **String**
Representam texto
*/

var nome = "Fabio"  
nome = "Renan"

/*:
### **Bool**
Valores lógicos (verdadeiro ou falso)
*/

var ligado = true
ligado = false

//: Como vocês puderam perceber, em nenhum momento precisamos dizer o tipo das variáveis acima, isso porque Swift consegue inferir o tipo delas atarvés de um recurso da linguagem conhecido como **inferência de tipo**. No entanto, nada nos impediria também de dizer o tipo delas explicitamente

let id: Int
id = 161

var endereço:String
endereço = "Av. Steve Jobs, Jundiaí"

//: Swift também tem a característica de ser **fortimente tipificada**, isso significa que uma vez declarada uma variável ou constante como sendo de um tipo, nao é possível atribuir um valor de um outro tipo a ela. Isso é uma forma de Swift assegurar que não ocorra uma atribuição errada durante a execução do codigo levando a um *crash* inesperado.

var cel = "9087-4544"

//cel = 99890478   //Erro, estamos tentando atribuir um inteiro (Int) a uma variavel que armazena texto (String)

/*: 
## **Interpolação de Strings**

Um outro recurso interessante de Swift é você poder expressar valores de outros tipos como fazendo parte de uma String, isso se chama **interpolação de Strings**.

No exemplo abaixo estamos através dos símbolos \\\( ) dizendo que queremos expressar o valor contido na variável nome e o valor 1.83 como sendo parte de um texto.
*/

"\(nome) possui tem \(1.83) de altura"

/*: 
## **Operando com constantes e varíaveis**

Podemos em alguns momento querer converter o valor de uma variável ou constante de um tipo para outro para poder realizar algum tipo de operação.

*/

var valorInteiro = 5

var valorReal = 3.5

//: Observe que para realizarmos a operação de soma entre valorInteiro e valorReal, precisaremos primeiro converter o valor contigo em valorInteiro para Double, isso porque Swift não nos permite realizar operações com variáveis de tipos diferentes. Vale lembrar que apenas o valor contigo em valorInteiro foi convertido para Double e não o tipo da variável, valorInteiro continua sendo Int, apenas convertemos seu valor temporariamente para realizar o cálculo.

var soma = Double(valorInteiro) + valorReal

/*: 
## **Operando com valores literais**

A história agora muda um pouco quando estamos operando sobre valores expressos diretamente no código, esses são os chamados valores literais.
*/

var valorAproximado = 10

/*: Aqui temos dois valores literais (10 e 0.3456). Valores literais são aqueles que aparecem diretamente no seu código-fonte. A soma é possível sim, porque estamos somando dois valores e não duas variáveis. Valores literais não possuem um tipo explicito.

E mais uma vez, quando falamos de Tipagem Segura em Swift, queremos dizer que Swift checa o seu código, como por exemplo o tipo das variáveis no código anterior, antes de fazer a soma, e marca os tipos que não combinam como erro. Isso evita que você cometa erros quando trabalha com valores de variáveis ou constantes de tipos diferentes
*/

var valorExato = 10 + 0.3456

//: Aula que vêm iremos explorar bastante os operadores de Swift ;)




