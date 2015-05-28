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
# **Gabarito - Semana 1:**

1 - Constantes e variáveis devem ser declaradas antes de ser usadas. Para ter certeza que tipo de valor pode ser armazenado, você pode especificar o tipo escrevendo ": tipoEscolhido" após a variável.

Veja o seguinte exemplo:
*/
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
/*: 
**Desafio 1:** Crie uma constante com um tipo explícito de `Float` e um valor de `6`.

Resposta:
*/
let constante:Float = 6
/*:

---

2 - Falhando no Playground.

**Desafio 2:** Tente remover a conversão para `String` da última linha de código. Qual é o erro que é gerado? Comente a sua resposta.
*/
let label = "The width is "
let width = 74
let widthLabel = label + String(width)
//: Resposta:
//let widthLabel = label + width

//Não é possível concatenar String com Int, deverá ser feita uma conversão do valor contido em width que é um Int (74) para um valor do tipo String ("74")
/*:

---

3 - Há uma maneira bem mais simples de incluir valores em strings: escrevendo o valor em parênteses, e escrevendo uma barra invertida ‘ \ ‘ antes do parêntese.
*/
let nome = "André"
var saldo = 0.47
var deposito = 50
/*: 
**Desafio** 3: Use \( ) para comunicar o saldo da conta bancária do André após o depósito de R$50 com a função `println()`. Você precisará incluir um cálculo em uma `String` e, também incluir o nome do cliente junto com a saudação Olá.

Resposta:
*/
println("Olá \(nome), seu saldo é de \(saldo + Double(deposito)) reais")
/*:
Lembre-se que para poder realizar algum calculo aritmético com 2 ou mais variáveis ou constantes é preciso que ambas sejam do mesmo tipo, por isso tivemos que converter o valor de deposito para `Double`.

---

4 - Para essa tarefa você irá precisar dos conhecimentos sobre `switch` e do operador `Range`.

**Desafio 4:** Classifique o tamanho de diversos Strings imprimindo a sua categoria segundo essa regra sugerida:


 Clarificando, imprima na tela:
 * "Pequenos" para frases (Strings) com até dez caracteres;
 * "Médios" para frases que tenham entre 11 e 25 caracteres;
 * "Grandes" para frases que possuem de 26 a 50 caracteres;
 * "Grandes pra caramba!"para as que tenham mais de 50 caracteres.


Resposta:

Há 3 formas de interpretar esse exercício.

Na primeira vamos apenas considerar que já contamos os caracteres em uma String e dar um valor de 25 para usar o switch em seguida.
*/
var tamanhoDeUmaString = 25

switch tamanhoDeUmaString {
    
case 0...10:
    println("Pequenos")
case 11...25:
    println("Médios")
case 26...50:
    println("Grandes")
default:
    println("Grandes pra caramba!")
    
}
//:Agora vamos fazer de outra forma, usando a free function chamda count que permite contar os elementos de uma String, no entanto, também são contados os espaços em branco.
var frase = "Uma frase qualquer"

switch count(frase) {   //18
    
case 0...10:
    println("Pequenos")
case 11...25:
    println("Médios")
case 26...50:
    println("Grandes")
default:
    println("Grandes pra caramba!")
    
}
//:Uma outra forma é fornecer uma String, e contar apenas as letras pulando os espaços em branco. Vamos lá!
var letras = 0

for char in frase {
    
    if char == " " {
        
        continue
        
    }
    
    letras++
    
}

switch count(frase) {   //16
    
case 0...10:
    println("Pequenos")
case 11...25:
    println("Médios")
case 26...50:
    println("Grandes")
default:
    println("Grandes pra caramba!")
    
}
