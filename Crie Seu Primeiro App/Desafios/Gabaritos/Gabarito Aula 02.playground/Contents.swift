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
# **Gabarito - Aula 02:**

1 - Podemos utilizar as estruturas de fluxo de controle, em particular as estrutruras condicionais, para decidir quais trechos de código serão executados com base em condições.

**Desafio 1:** Estabeleca uma forma de identificar se um valor do tipo String está vazio, ou seja, sem texto ("") e emita uma mensagem dizendo que não há texto. Caso contrário, crie uma mensagem dizendo que há texto e a quantidade de caracteres (simbolos) que existem nesse texto.

Dica: pesquise sobre a *free function* count(). Free functions são funções já prontas e disponibilziadas pela linguagem.

Resposta:

`count()` é uma função da linguagem que irá nos possibilitar, nesse caso, contar os elementos (caracteres) de uma String. Lembrando que espaços em branco também são considerados caracter.
*/
var textoQualquer = "Foco no Swift"

if textoQualquer == "" {
    
    "Não há texto"
    
} else {
    
    "Existem \(count(textoQualquer)) caracteres no texto forneceido"
    
}
//: Podemos também utilizar uma propriedade do tipo String chamada isEmpty (está vazio?) que verificar se existe texto ou não na String e retorna true ou false.
textoQualquer = ""

if textoQualquer.isEmpty {
    
    "Não há texto"
    
}
/*: 
Para uma lista com mais propriedades do tipo String e de outros, consultar: [Biblioteca de Referência Padrão da Apple](https://developer.apple.com/library/ios/documentation/General/Reference/SwiftStandardLibraryReference/)

---

2 - Para essa tarefa você irá precisar dos conhecimentos sobre Switch e do operador Range.

**Desafio 2:** Classifique o tamanho de diversos Strings imprimindo a sua categoria segundo essa regra sugerida:


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
//:Agora vamos fazer de outra forma, usando a free function chamada count() que, como já vimos anteriormente, nos permite contar os elementos de uma String, no entanto, também são contados os espaços em branco.
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
//:Uma outra forma é fornecer uma String, e contar apenas as letras criando uma condição para pular os espaços em branco. Vamos lá!
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
/*:

---

3 - Vimos que as estruturas de repetição, conhecidos como Loops, nos permitem repetir a mesma instrução diversas vezes, e que o loop `for` serve para percorrer uma sequência de elementos em um intervalo.

**Desafio 3:** Utilizando as estruturas que vimos em fluxo de controle, crie uma maneira de contar as vogais, consoantes e caracteres especiais em um texto qualquer.

Resposta:

Primeiro vamos criar 3 contadores, um para contar as vogais, outro para as consoantes e mais um outro para cacteres especiais e inicializá-los com 0 para que mais tarde possam ser incrementados.
*/
var vogais = 0
var consoantes = 0
var outros = 0
//: Agora vamos fornecer um texto qualquer
var texto = "Oi, como vai de Swift hoje?"
/*: 

Vamos utilizar 2 estruturas para esse exercício, um loop `for-in` para percorrer a String e um condicional `switch` para incrementar a variável correspondente.

Também estaremos utilizando uma outra propriedade de String chamada `lowercasaString` para considerar caracteres maiúsculos como sendo minúsculos, ou seja, sem criar distinção entre um e outro. Logo ele irá considerar "a" == "A".

*/
for char in texto.lowercaseString {
    
    switch char {
        
    case "a", "e", "i", "o", "u":
        char
        ++vogais
        
    case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
        char
        ++consoantes
        
    default:   //espaço em branco, !, ?, *, ....
        char
        ++outros
        
    }
    
}
