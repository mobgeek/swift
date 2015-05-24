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
# **Exercícios práticos - Semana 2**

1 - Através do Switch podemos fazer comparações de diversas formas. Eles não estão limitados a números inteiros e testes de igualdade. Note que após a execução do código dentro do caso correspondente, o programa sai do Switch.

Veja o exemplo a seguir:
*/
let legume = "pimentão"

switch legume {
    
case "salsão":
    
    let legumeCommentário = "Adicione algumas uva passas."
    
case "pepino", "agrião":
    
    let legumeCommentário = "Isto seria um bom sanduiche para um lanche."
    
case let x where x.hasPrefix("piment"):
    
    let legumeCommentário = "É apimentado \(x)?"
    
default:
    
    let legumeCommentário = "Numa sopa tudo fica bom."
}
/*:
**Desafio 1:** Experimente remover o default case (case padrão). Qual erro é gerado? A posição do default dentro do switch altera o resultado?

Resposta:
*/





/*: 

---

2 - Você pode utilizar `if` e `let` juntos para checar se um valor existe. Estes valores são chamados de optionals. Nil é um valor especial que representa ausência de valor. Escreva um ponto de interrogação (?) após um tipo de valor para indicar que o valor é um optional.

Veja o seguinte exemplo:
*/
var optionalString: String? = "Olá"

optionalString = nil

var optionalNome: String? = "João da Silva"

var saudação = "Olá!"

if let nome = optionalNome {
    saudação = "Olá, \(nome)"
}
/*: 
**Desafio 2:** Mude o `optionalNome` para `nil`. Qual é a saudação que você obtém? Adicione uma clausula de `else` que estabelecerá uma saudação diferente se o `optionalNome` for `nil`.

Resposta:
*/





/*: 

---

3 - Use func para declarar uma função. Invoque uma função escrevendo seu nome seguida por uma lista de argumentos entre parêntesis. Use  -> para separar os nomes dos parâmetros e tipos do tipo de retorno da função.

Veja:
*/
func saudação(nome: String, dia: String) -> String {
    return "Olá \(nome), hoje é \(dia)."
}
saudação("Viviane", "quinta")
/*: 
**Desafio 3:** Substitua o parâmetro `dia` por outro parâmetro que descreva o prato do dia.

Resposta:
*/





/*:

---

4 - Funções também podem ter um número variável de argumentos, colecionando o mesmo em uma lista de arrays: uma lista ordenada de valores do mesmo tipo.

Analise o seguinte exemplo:
*/
func somaDe (números: Int...) -> Int {
    var soma = 0
    for número in números {
        soma += número
    }
    return soma
}
somaDe()
somaDe(42, 597, 12)
/*: 
**Desafio 4:** Escreva uma função que calcule a média de seus argumentos.

Resposta:
*/





/*: 


---

5 - Use `for-in` para fazer a iteração de itens em um dicionário atribuindo um par de nomes para usar em cada par de valor-chave. Dicionários são uma coleção desordenada. Assim, suas chaves e valores são iterados em uma ordem arbitrária.

Veja o seguinte exemplo:
*/
let númerosInteressantes = [
    "Primo": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Quadrado": [1, 4, 9, 16, 25],
]
var maior = 0
for (tipo, números) in númerosInteressantes{
    for número in números {
        if número > maior {
            maior = número
        }
    }
}
maior
/*: 
**Desafio 5:** Adicione uma outra variável para acompanhar que tipo de número era o maior (Primo, Fibonacci ou Quadrado) assim como qual era o maior número.

Resposta:
*/





/*: 

---

6 - Você pode escrever o closure de uma função (blocos indepedentes de funcionalidade que podem ser passadas e usadas pelo seu código) sem escrever seu nome usando apenas chaves ({}) no começo e no final da declaração. Use in para separar os argumentos e tipo de retorno do corpo.

Veja o exemplo que segue:
*/
var números = [13, 7, 34, 54]

números.map({
    
    (número: Int) -> Int in
    
    let result = 3 * número
    
    return result
})
/*: 
**Desafio 6:** Descubra no Playground qual a finalidade do método map oferecido pelo tipo Array. Reescreva o closure da função para que ela retorne zero (0) para todos os número ímpares.

Resposta:
*/





/*:

---

7 -  Imagine que você queira saber a hora de nascer do sol e por do sol de um servidor qualquer. O servidor irá responder com uma informação correta ou ele responderá com uma informação de erro.

Analise o exemplo que segue:
*/
enum respostaServidor{
    case Resultado(String, String)
    case Erro(String)
}

let sucesso = respostaServidor.Resultado("6:00", "18:00")
let falha = respostaServidor.Erro("Por Favor Reinstale o Universo e Reinicie")

switch sucesso {
case let .Resultado(nascerDoSol, porDoSol):
    let  respostaServidor = "O nascer do sol é às \(nascerDoSol) e o por do sol é às \(porDoSol)."
case let .Erro(erro):
    let respostaServidor = "Falha...  \(erro)"
}
/*:
**Desafio 7:** Adicione um terceiro case para a `respostaServidor` e para o `switch`.

Resposta:
*/






