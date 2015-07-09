#**Projeto**:

Galera, estamos com um projeto novo, que já vendo sendo desenvolvido há algum tempo fruto de ideias dos alunos do curso. O App tem dois objetivos principais: ensinar a usar webservices em Swift e concentrar as perguntas e respostas mais frequentes (FAQ) envolvendo Swift/Playground/Xcode. O projeto ainda estrá em fase experimental. Temos testado o código com uma pequena quantidade de dados, mas achamos que abrindo o código do projeto para a comunidade de Swift da MobGeek poderia ser uma boa maneira de ensinar a usar webservices como o Parse, que é utilizado no App e que já vem sendo pedido pelos alunos há algumas turmas ;) Além, é claro, trazer mais um exemplo de app real para ensinar como funcionam alguns conceitos de Swift na prática!

##**Para quem tiver interesse em colaborar**:

- Será fornecida uma conta coletiva exclusiva para vocês
- Para saber o email e senha dessa conta, mandar uma mensagem para: contato@mobgeek.com.br.
- Essa conta será essencial para que vocês possam modificar os dados que alimentam o App no site do Parse.

##**Alguns cuidados a tomar**:

- Sempre fazer um backup dos dados do site caso venham a fazer algum alteração drástica no App que possa influenciar os demais alunos envolvidos.
- Para realizar o backup:
 - Ir em exportar dados no canto superior direito na página da tabela com os dados que são usados no projeto.
 - Uma mensagem será enviada automaticamente ao email coletivo contendo um arquivo JSON dos dados atuais do Parse
 - Qualquer erro que venha a ocorrer, basta subir o arquivo JSON de backup do email para o site.


##**Para aqueles interessados em apenas baixar o App para si**:

- Criar uma conta no [Parse] (https://www.parse.com/signup)
- Mudar o ID e chave o cliente para os do App da conta que você acabou de criar. Para isso, siga os seguintes passos:
 1. Na sessão My Apps do Parse vá em: *Quickstart > Data > Mobile > iOS > Swift > Existing Project*
 2. No final da página, copie o código contido no método de AppDelegate para o mesmo local no arquivo do projeto que você baixou do Git.
 3. Agora seu App na sua conta do Parse, está conectado com o projeto que você baixou
 4. Para popular o site do Parse com dados para o projeto, subir o arquivo JSON, chamado Dados.json, que se encontra na pasta do projeto que você baixou
 5. Excluir todos os arquivos da coluna file e repopular a coluna com os arquivos da pasta Files que também se encontra no projeto. (É preciso fazer isso pois os arquivos antigos estavam internamente vinculados a outra conta do parse, podendo gerar crash no código ao lê-los pois dará acesso negado)
Agora é só se divertir com o App :)

##**Alguns detalhes do App**:

- A estrutura atual do código do App suporta as 4 colunas (category, title, questionBeggining, file) que criamos no site do Parse

- Acrescentar novas linhas ou modificar dados existentes na tabela do site, não compromete o funcionamento do App

- Caso esteja pensando em adicionar novas funcionalidades ao App e precisar acrescentar novas colunas ou objetos, lembrar de fazer um backup das informações antigas ;)

##**Alguns conceitos de Swift que vocês irão encontrar no App**:

- **Closures** (bastante `sort()`, `filter()` e ao criar ações para os alertas usando `UIAlertAction`)
- **Guard** (nova estrutura de fluxo de controle de Swift 2.0)
- **Sobrecarga de Operadores** (p/ poder comprar tuplas usando `==`)
- **Tratamento de Erros** ao verificar acesso a internet (`do try catch...`)
- Muito de **Dicionários** e **Tuplas**
- **Type Casting** para converter os dados do parse no código
- **Herança**
- **Extensions** para adicionar funcionalidades que serão compartilhadas entre várias `views` e `tableViews`
- **Optionals** englobando: **Optional Binding**, **Nil Coalesing**, **Optional Chaining**

---
Bom, galera! Fiquem à vontade para mexer no App. Seu código já está bem comentado, mas para maiores detalhes, é só ir na [página de release](https://github.com/mobgeek/swift/releases/tag/v2.0) do projeto aqui no Git. É lá que vamos atualizar novidades do código: bugs, problemas resolvidos, melhorias, e assim por diante ;)
