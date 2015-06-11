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
# **Exercícios práticos - Aula 03**

1-  Você pode utilizar `if` e `let` juntos para checar se um valor existe. Estes valores são chamados de optionals. Nil é um valor especial que representa ausência de valor. Escreva um ponto de interrogação (?) após um tipo de valor para indicar que o valor é um optional.

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
**Desafio 1:** Mude o `optionalNome` para `nil`. Qual é a saudação que você obtém? Adicione uma clausula de `else` que estabelecerá uma saudação diferente se o `optionalNome` for `nil`.

Resposta:
*/






/*:


---

2 - Use `for-in` para fazer a iteração de itens em um dicionário atribuindo um par de nomes para usar em cada par de valor-chave. Dicionários são uma coleção desordenada. Assim, suas chaves e valores são iterados em uma ordem arbitrária.

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
**Desafio 2:** Adicione uma outra variável para acompanhar que tipo de número era o maior (Primo, Fibonacci ou Quadrado) assim como qual era o maior número.

Resposta:
*/





/*:

---

3 - Vimos durante a esse aula como podemos utilizar o framework Core Image facilmente aplicar um filtro a uma imagem utilizando alguns tipos dele.
*/
let imagem = UIImage(named: "bebe.jpg")

let novaImagem = CIImage(image: imagem)

let filtro = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage": novaImagem, "inputIntensity": 1.0])

filtro.outputImage
/*:
**Desafio 3:** Pesquise na documentação da Apple sobre filtros do Core Image um filtro específico chamado CIHueAdjsut e aplique esse filtro primeiro em cima da imagem importada, depois na imagem que possou pelo primeiro filtro CISepiaTone. Lembrem-se que a imagem deve ser do tipo CIImage ;)

Resposta:
*/






