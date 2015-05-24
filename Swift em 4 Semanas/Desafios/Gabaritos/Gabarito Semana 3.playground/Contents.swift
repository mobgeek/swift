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
# **Gabarito - Semana 3**

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
class Forma {
    
    var númeroDeLados = 0
//: 1º Passo: Adicionar a propriedade constante:
    let descriçãoPadrão = "Eu sou uma forma Swift"
    
    func descriçãoSimples() -> String {
        return "Uma forma com \(númeroDeLados) lados."
    }
/*:
2º Passo: O método `comparaCom` compara se duas formas geométricas do tipo `Forma` possuem o mesmo número de lados. Usamos o operador `==` para fazer a comparação entre a propriedade `númeroDeLados` de cada forma.
*/
    func comparaCom(forma: Forma) -> String {
        
        if forma.númeroDeLados == self.númeroDeLados {
            
            return "Bingo! Essas duas formas têm o mesmo nº de lados!"
            
        } else {

            return "O número de lados não é o mesmo."
            
        }
    }
}
/*:

---

2 - Agora que já criamos uma classe `Forma`, que será o nosso molde para criar diferentes formas, que tal começarmos a acessar suas propriedades e métodos?

**Desafio 2:** Usando a classe `Forma` no exercício 1, crie uma instância inserindo parêntesis após o nome da classe. Use o dot syntax (sintaxe do ponto) para acessar as propriedades e métodos de uma instância.

Resposta:

Lembrando que Swift fornece um inicializador padrão para classe, se todas as propriedades possuírem valores padrão definidos e a classe não fornecer pelo menos um initializer.

 Com esse initializer padrão você pode criar uma nova instância e todas as propriedades desta instância vão conter os seus valores padrão.

1º Passo: Criar uma `Forma` e dar `7` para sua propriedade `númeroDeLados`
*/
var forma = Forma()

forma.númeroDeLados = 7
//: 2º Passo: Criar uma outra `Forma` e modifcar a sua propriedade `númeroDeLados` para que a gente possa comparar com a anterior.
var outraForma = Forma()

outraForma.númeroDeLados = 2
//: 3º Passo: Vamos usar o método de instância `comparaCom` passando a segunda `Forma` que criamos como argumento. Agora, podemos conferir ao lado se o `String` que o método retorna corresponde a realidade :-)
forma.comparaCom(outraForma)
/*:

---

3 - Até agora utilizamos o inicializador padrão fornecido pela classe Forma quando nenhum inicializador é informado. Que agora criarmos nossos próprios inicializadores customizados?

**Desafio 3:** Nesta versão de classe `Forma` há algo importante que está faltando: um inicializador para invocar uma classe quando uma instância for criada. Complete o exercício abaixo usando `init`, `self` e `func`.
*/
// class NomeDaForma{
//    var númeroDeLados: Int = 0
//    var nome: String   
/*:
Resposta:

Aqui vamos customizar a nossa inicialização através de um `init` que definimos com um parâmetro nome do tipo `String`. Assim, podemos criar uma forma passando o seu nome como argumento.
*/
class NomeDaForma{
    var númeroDeLados: Int = 0
    var nome: String
    
    // Definindo o inicializador:
    
    init(nome: String) {
        
        self.nome = nome
    }
    
    // A forma pode ser simplesmente descrita pela seua propriedade númeroDeLados. Por isso, criamos um método para retornar um String que faz justamente isso.
    
    func descriçãoSimples() -> String {
        return "Uma forma com \(númeroDeLados) lados."
    }
}
/*:  

---

4 - Métodos de uma classe que sobreescrevem (conhecidos em inglês como override) a implementação de uma subclasse são iniciados com override. O compliador também consegue detectar métodos com override que na realidade não estão sobreescrevendo nenhum método na subclasse.
    
Veja o seguinte exemplo:
*/
class Quadrado: NomeDaForma {
       
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
/*:  
**Desafio 4:** Crie outra subclasse de `NomeDaForma` chamada de `Círculo` que possui um raio e um nome como argumentos para seu inicializador. Implemente um método de área e de `descriçãoSimples` para a classe `Círculo`.

Resposta:

Declaramos uma constante com a letra grega `π` para representar a constante matemática 'pi'. Para a grande maioria de cálculos simples podemos usar a aproximação `3,14`. Aqui vamos precisar dela para calcular a area do círculo.
*/
let π = 3.14

class Círculo: NomeDaForma {
    
    var raio: Double
    
    init(raio: Double, nome: String) {
//:Primeiro, vamos inicializar todas as propriedades da classe.
    self.raio = raio
//:Depois, chamamos o init da superclasse apropriado para continuar a inicialização cadeia acima porque as propriedades herdadas de `NomeDaForma` também precisam ser inicializadas.
    super.init(nome: nome)
        
    }
    
    func área() -> Double {
//:A area de do círculo: A = π * r * r
    return raio * raio * π
        
    }
//:É útil poder sobrescrever o método `descriçãoSimples` da superclasse `NomeDaForma` porque assim podemos dar uma descrição personalizada para a nossa Subclasse `Círculo`.
    override func descriçãoSimples() -> String {
        return "Um círculo com o raio de \(raio)."
    }
}
/*:
Hora de testar se o que implementamos faz sentido:

Se liga que Swift fornece automaticamente nomes externos para cada parâmetro do initializer se você não fornecer um nome externo. Neste caso, 'raio' e 'nome' estão disponíveis como nomes externos.
*/
let circulo = Círculo(raio: 2, nome: "futuro sorriso")

circulo.área()
/*:

---

5 - Além de propriedades de armazemento que apenas guardam algum valor, existem as propriedades computadas que calculam um valor.

**Desafio 5:** Relembrando que além de propriedades armazenada, classes, estruturas e enumerações podem definir propriedades computadas. Complete a sintaxe abaixo de um triângulo equilátero usando um `getter`, um `setter` e uma `func override`.
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
//: Resposta:
class TriânguloEquilátero: NomeDaForma {
    
    var comprimentoLado = 0.0
    
    init(comprimentoLado: Double, nome: String) {
        
        self.comprimentoLado = comprimentoLado
        
        super.init(nome: nome)
        
        númeroDeLados = 3
    }
//:Usamos propriedades computadas para calcular um valor em vez de armazená-lo. É através do setter e do getter que vamos poder ler e dar valor as propriedades respectivamente. Ao final, você vai poder trabalhar com o perímetro como se fossse uma propriedade armazenada.
    var perímetro: Double {
        
        get {
//:Perímetro é a soma dos lados e como os lados são iguais podemos diretamente multiplicar a nossa propriedade comprimentoLado por três.
            return 3.0 * comprimentoLado
            
        }
        
        set(novoPerímetro) {
            
            comprimentoLado = novoPerímetro / 3.0
            
        }
        
        /* Uma alternativa para o nosso setter seria usar o nome implícito newValue:
        
        set(newValue) {
        
        comprimentoLado =  newValue / 3.0
        
        } */
        
    }
//:Como no exemplo acima, podemos personalizar a mensagem que descreve o nosso triângulo equilátero sobrescrevendo o método `descriçãoSimples`
    override func descriçãoSimples() -> String {
        
        return "Um triângulo equilátero com o comprimento dos lados igual a \(comprimentoLado)"
        
    }
    
}

var triangulo = TriânguloEquilátero(comprimentoLado: 2.5, nome: "um triângulo")
//:Chamanado o `getter`:
var perimetroDoTriangulo = triangulo.perímetro
//:Chamando o `setter`:
triangulo.perímetro = 9.3

triangulo.comprimentoLado
/*:

---

**Desafio Extra:**  NTFPN*: Você pode precisar responder a atualização do valor de uma propriedade, em vez de ter que calcular uma propriedade como no exemplo anterior. Use os observadores de propriedades `willSet` e `didSet` para fornecer código que seja executado antes e/ou depois de um novo valor ser armazenado em uma propriedade. Usando estes observadores de propriedades no Playground, invoque um método de uma classe que você irá criar chamada `TriânguloEQuadrado` que garanta que o comprimento do lado do triângulo equilátero seja sempre igual ao comprimento do lado do quadrado.
    
    *NTFPN: "Não tá fácil pra ninguém"

Resposta:
*/
class TriânguloEQuadrado {
    
    var triângulo: TriânguloEquilátero {
//:`willSet` é chamado exatamente antes do valor ser armazenado, isto é, antes de um triângulo ser atribuído a esta propriedade. É um ótimo momento para garantir que os triângulos equiláteros e os quadrados dessa classe sempre tenhamo o mesmo comprimento de lado.
        willSet {
            
            quadrado.comprimentoLado = newValue.comprimentoLado
            
        }
    }
    
    var quadrado: Quadrado {
        
        willSet {
            
            triângulo.comprimentoLado = newValue.comprimentoLado
            
        }
    }
    
    init(comprimentoLado: Double, nome: String) {
        
        triângulo = TriânguloEquilátero(comprimentoLado: comprimentoLado, nome:nome)
        
        quadrado = Quadrado(comprimentoLado: comprimentoLado, nome: nome)
    }
}
/*:
Importante: Os observadores `willSet`, como também `didSet`, não são chamados quando a propriedade é inicialiada. Ambos são chamados apenas quando o valor da propriedade é atualizado fora do contexto da inicialização, o que vamos fazer em seguida.

Vamos criar um instância da classe `TriânguloEQuadrado`, que por sua vez cria um triângulo equilátero e um quadrado para armazenar em suas propriedades. Os dois terão o mesmo comprimento de lado que passamos como argumento do initializer.
*/
var triânguloEQuadrado = TriânguloEQuadrado(comprimentoLado: 10, nome: "uma forma teste")

triânguloEQuadrado.quadrado.comprimentoLado

triânguloEQuadrado.triângulo.comprimentoLado
//:Será que o willSet está dando conta do recado? Vamos então atribuir um novo quadrado com um comprimentoLado diferente do anterior.
triânguloEQuadrado.quadrado = Quadrado(comprimentoLado: 45, nome: "grande quadrado")
/*: 
Se o observador fez o seu papel devemos ter o triângulo com o mesmo comprimento de lado agora, ou seja, o valor 45 que passamos na última linha como argumento do initializer.
*/
triânguloEQuadrado.triângulo.comprimentoLado


