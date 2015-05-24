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
# **Exercícios práticos - Semana 3**

1 - Use class precedida pelo nome da classe para criar uma classe. Uma propriedade de declaração em uma classe é escrita da mesma forma que uma declaração de uma constante ou variável, exceto que ela é escrita dentro do contexto da classe. Declarações de métodos são escritos da mesma forma que funções.

Veja o seguinte exemplo de uma forma geométrica:
*/
/* class Forma {
    var númeroDeLados = 0
    func descriçãoSimples() -> String {
        return "Uma forma com \(númeroDeLados) lados."
    }
} */
/*:
**Desafio 1:** Adicione uma propriedade constante usando `let`, e adicione um outro método que usa um argumento para comparar se duas formas geométricas possuem o mesmo número de lados.

Resposta:
*/





/*:

---

2 - Agora que já criamos uma classe `Forma`, que será o nosso molde para criar diferentes formas, que tal começarmos a acessar suas propriedades e métodos?

**Desafio 2:** Usando a classe `Forma` no exercício 1, crie uma instância inserindo parêntesis após o nome da classe. Use o dot syntax (sintaxe do ponto) para acessar as propriedades e métodos de uma instância.

Resposta:
*/





/*:

---

3 - Até agora utilizamos o inicializador padrão fornecido pela classe Forma quando nenhum inicializador é informado. Que agora criarmos nossos próprios inicializadores customizados?

**Desafio 3:** Nesta versão de classe `Forma` há algo importante que está faltando: um inicializador para invocar uma classe quando uma instância for criada. Complete o exercício abaixo usando `init`, `self` e `func`.
*/
// class NomeDaForma{
//    var númeroDeLados: Int = 0
//    var nome: String
//: Resposta:




    
/*:  

---

4 - Métodos de uma classe que sobreescrevem (conhecidos em inglês como override) a implementação de uma subclasse são iniciados com override. O compliador também consegue detectar métodos com override que na realidade não estão sobreescrevendo nenhum método na subclasse.
    
Veja o seguinte exemplo:
*/
/*    class Quadrado: NomeDaForma {
       
        var comprimentoLado: Double
        
        init(comprimentoLado: Double, nome: String) {
            self.comprimentoLado = comprimentoLado
            super.init(nome: nome)
            númeroDeLados = 4
        }
        
        func área() ->  Double {
            return comprimentoLado * comprimentoLado
        }
        
        override func descriçãoSimples() -> String {
            return "Um quadrado com o comprimento dos lados \(comprimentoLado)."
        }
    }
    
    let teste = Quadrado(comprimentoLado: 5.2, nome: "meu quadrado teste")
    teste.área()
    teste.descriçãoSimples()
*/
/*:  
**Desafio 4:** Crie outra subclasse de `NomeDaForma` chamada de `Círculo` que possui um raio e um nome como argumentos para seu inicializador. Implemente um método de área e de `descriçãoSimples` para a classe `Círculo`.

Resposta:
*/
    
    



/*:

---

5 - Além de propriedades de armazemento que apenas guardam algum valor, existem as propriedades computadas que calculam um valor.

**Desafio 5:** Relembrando que além de propriedades armazenada, classes, estruturas e enumerações podem definir propriedades computadas. Complete a sintaxe abaixo de um triângulo equilátero usando um `getter`, um `setter` e uma `func override`.

Resposta:
*/
/*    class TriânguloEquilátero: NomeDaForma{
        var comprimentoDoLado: Double = 0.0
        
        init(comprimentoDoLado: Double, nome: String) {
            self.comprimentoDoLado = comprimentoDoLado
            super.init(nome: nome)
            númeroDeLados = 3
        }
        
        var perímetro: Double { … }
        …
    }
    
*/
/*:

---

**Desafio Extra:**  NTFPN*: Você pode precisar responder a atualização do valor de uma propriedade, em vez de ter que calcular uma propriedade como no exemplo anterior. Use os observadores de propriedades `willSet` e `didSet` para fornecer código que seja executado antes e/ou depois de um novo valor ser armazenado em uma propriedade. Usando estes observadores de propriedades no Playground, invoque um método de uma classe que você irá criar chamada `TriânguloEQuadrado` que garanta que o comprimento do lado do triângulo equilátero seja sempre igual ao comprimento do lado do quadrado.
    
    *NTFPN: "Não tá fácil pra ninguém"

Resposta:
*/


