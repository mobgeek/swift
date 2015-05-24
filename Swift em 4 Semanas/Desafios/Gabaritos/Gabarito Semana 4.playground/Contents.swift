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

# **Gabartio - Semana 04**

1 - Parâmetros de funções e métodos podem tanto ter um nome local para usar dentro do corpo da função, como um nome externo para usar quando as funções são chamadas. Com os parâmetros de inicialização não será diferente, porém inicializadores não possuem nomes que os identificam como funções e métodos. Por isso,  Swift irá fornecer um nome externo automático para todo parâmetro de um initializer mesmo que você mesmo não de um nome externo.

**Desafio 01:** Defina uma estrutura chamada `Cor` com três propriedades constantes chamadas `red`, `green` e `blue`. Essas propriedades devem armazenar valores entre `0.0` e `1.0`, que representam a quantidade de vermelho, verde e azul em uma cor (Para saber mais sobre o sistema RGB, consulte o nosso último desafio prático :-)

Resposta:
*/
/* struct Cor {
    
    let red, green, blue: Double
    
    
    
} */
/*:
**Desafio 02:** Forneça um initializer com três parâmetros com nomes e tipos apropriados para os seus componentes de cor.

Resposta:
*/
struct Cor {
    
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        
        self.red = red
        self.green = green
        self.blue = blue
    }
    
}
/*:
**Desafio 03:** Use o initializer de `Cor` para criar uma cor branca.

Resposta:
*/
let branco = Cor(red: 1.0, green: 1.0, blue: 1.0)
//:Como criar realmente uma cor branca com o UIKit?
var corBranca = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//:Também podemos usar um método de UIColor que já nos retorna a cor branca automaticamente
corBranca = UIColor.whiteColor()
/*:

---

2 - Use extensões (extensions) para adicionar funcionalidades à tipos existentes, tais como novos métodos de instância e propriedades computadas, entre outras. Você também pode usar uma extensão para adicionar conformidade de protocolo para um tipo que foi declarado em outros lugares, ou até para um tipo que tenha sido importado de uma biblioteca ou de um framework.

Veja o exemplo a seguir:
*/
protocol ProtocoloSimples {
    
    var descriçãoSimples: String { get }
    
    mutating func ajuste()
    
}

extension Int: ProtocoloSimples {
    var descriçãoSimples: String {
        return "O número \(self)"
    }
    mutating func ajuste() {
        self += 18
    }
}

7.descriçãoSimples
/*:
**Desafio 04:** Escreva um extension para o tipo Double que adicione uma propriedade `valorAbsoluto`.(De uma forma simplificada, o valor absoluto é o valor numérico desconsiderando o seu sinal)

Resposta:
*/
//extension Double {
//
//    var valorAbsoluto: Double {
//
//        switch self {
//
//        case let x where x > 0.0:
//
//            return x
//
//        case let x where x < 0.0:
//
//            return (-1) * x
//
//        default:
//
//            return 0.0
//
//        }
//    }
//}
//: Outra alternativa:
extension Double {
    
    var valorAbsoluto: Double {
        
        if self < 0.0 {
            
            return (-1) * self
            
        } else {
            
            return self
        }
    }
}

3.5.valorAbsoluto

0.0.valorAbsoluto

(-5.7).valorAbsoluto
/*:

---

3 - Use o operador `where` após o tipo de nome para especificar uma lista de condições - por exemplo, para que o tipo de nome implemente um protocolo, para que dois tipos sejam iguais, ou para que uma classe contenha uma superclasse especial.

Analise o seguinte exemplo, que também traz um pouco de Generics:
*/
/*func qualquerElementoComum <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
qualquerElementoComum([1, 2, 3], [3])
*/
/*: 
**Desafio 05:** Modifique a função `qualquerElementoComum` para fazer uma função que retorne uma array de elementos que quaisquer duas sequências tenham em comum.

Resposta:

3º Passo: A função agora retorna uma array do tipo T.Generator.Element
*/
func qualquerElementoComum <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> [T.Generator.Element] {
    
    // Primeiro, crie uma array varia do tipo dos elementos encontrados em cada Sequencia:
    
    var elementosEmComum: [T.Generator.Element] = []
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
//:1º Passo: Queremos na verdade é armazenar em uma array os elementos as duas sequências tem em comum:
                elementosEmComum.append(lhsItem)
                
            }
        }
    }
//:2º Passo: A função agora retorna a array dos elementos em comum.
    return elementosEmComum
}
qualquerElementoComum([1, 2, 3], [3])
