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
# Aula 02
## **Operadores Básicos**
Operadores são apenas símbolos especiais que você irá usar para checar, modificar ou combinar valores. Vamos ver alguns deles.

### **Atribuição** 
Armazenar valores em variáveis ou constantes
*/
let taxaMinima = 150
/*:
### **Aritiméticos** 
Realizar operações conhecidas da matemática (soma, subtração, divisão, multiplicação, resto)
*/
1 + 1
7 - 6
5 * 7
15.0 / 7.5
7 % 3
/*:
### **Pré/pós incremento/decremento** 
Uma forma rápida de aumentar/dimunir em 1 valores armazenados em variáveis

Optamos pelo **pré incremento/decremento** quando queremos primeiro modificar o valor contido na variável para depois fazer algo com ele.
*/
var pontosTotalAntes = 300
let pontosBonusAntes = ++pontosTotalAntes  //Primeiro incrementa para depois atribuir
pontosTotalAntes
pontosBonusAntes
//:Quando escolhemos usar **pós incremento/decremento**, o valor armazenado na variável só será alterado após ser feito algo com o valor antigo.
var pontosTotalDepois = 300
let pontosBonusDepois = pontosTotalDepois++  //Primeiro atribui para depois incrementar
pontosTotalDepois
pontosBonusDepois
/*:
### **Compostos** 
Uma forma simplifica de atualizar o valor de uma variável com seu próprio valor
*/
var passos = 1500

passos += 350
passos -= 350
passos *= 3
passos /= 3
/*:
### **Operadores de Comparação** 
Comparar 2 valores e retorna verdadeiro (true) ou falso (false)
*/
1 > 3
10 < 11
3.5 >= 3.5
2.86 <= 2
4 == 4
3 != 5
/*:
### **Operador de concatenação** 
Uma segunda utilidade do operador +. Quando utlizado entre 2 Strings, ele concatena, ou seja, junta as 2 em uma String apenas.
*/
let saudação = "Oi, "
var nome = "Renan"

saudação + nome

nome = "Mariana"

saudação + nome
/*:
### **Range**
Representar intervalos de valores (... , ..<)
*/
var intervalo = 1...10
var novoIntervalor = 1..<5
/*:
## Fluxo de Controle
Swift nos disponibiliza diversas formas de definir o fluxo de execução do nosso código. Para isso, usaremos basicamente 2 grupos de estruturas diferentes.

## **Estruturas Condicionais:**

Usadas para decidir qual conjunto de instruções será executado com base em certas condições que podemos estabelecer.

### **If-Else**
"SE" isso, então faça aquilo, "SENAO" faça aquilo outro
*/
var temperatura = 35

if temperatura >= 35 {
    
    "Tá quente! Partiu praia! ;-)"
    
} else if temperatura <= 25 {
    
    "Cariocas, preparem os seus casacos!"
    
} else {
    
    "Pessoal, ainda não esquentou de verdade."
    
}
/*:
Podemos ainda, estabelecer mais de uma condição para a mesma expressão `if` usando os operadores lógicos (&&, ||, !).

### **"E" Lógico (&&)**
A expressão retornará verdadeiro se **todas** as partes forem verdadeiras.
*/
var estarDisposto = true

if temperatura >= 35 && estarDisposto {
    
    "Tá quente! Partiu praia! ;-)"

}
/*:
### **"OU" Lógico (||)**
A expressão retornará verdadeiro se **pelo menos** uma das partes for vardadeira.
:*/
estarDisposto = false

if temperatura >= 35 || estarDisposto {
    
    "Tá quente! Partiu praia! ;-)"

}
/*:
### **"Negação" (!)**
Simplesmente troca de true para false e vice versa
:*/
if !estarDisposto {
    
    "Tá quente! Partiu praia! ;-)"

}
/*:
### **Switch**
"ESCOLHA" esse valor, "CASO" seja isso, então faça aquilo, ...
*/
var count = 346
var contadorNatural: String

switch count {
case 0...9:
    contadorNatural = "algumas vezes"
case 10...99:
    contadorNatural = "dezenas de vezes"
default:
    contadorNatural = "um monte de vezes"
}

let mensagem = "Você me ligou \(contadorNatural)"
/*:
## **Estruturas de Repetição (Loops):**
Ideais para quando precisamos repetir um conjunto de instruções múltiplas vezes.

### **For-in**
"PARA" valor "EM" sequência
*/
for elemento in 1...9 {
    
    //elemento é uma constante temporária, isto é, ela só existe durante a execução deste loop!
    
    println("\(elemento) vezes 6 é \(elemento * 6)")
    
}

for character in "Cafe" {
    
    println("Letra é \(character)")
    
}
//: Repare que as constantes elemento e character definidas nos loops, não são do tipo String mas sim do tipo Character. Para verificar, use "option + click" em cima das constantes para ver seu tipo.
/*:
### **For-Condição-Incremento**
"PARA" um valor inicial "ENQUANTO" condição verdadeira "INCREMENTA" valor
*/

for var tentativa = 0; tentativa < 3; ++tentativa {
    
    println("Tentativa número: \(tentativa)")
    
}
/*:
### **While**
"ENQUANTO" isso, faça aquilo
*/
var dinheiro = 5

while dinheiro > 3 {
    
    println("Pode pedir a última! Saldo:\(dinheiro)")
    
    --dinheiro
}
/*:
### **Do-While**
"FAÇA" isso, "ENQUANTO" aquilo
*/
dinheiro = 10

do {
    
    println("Grana: \(dinheiro)")
    
    --dinheiro
    
} while dinheiro < 3




