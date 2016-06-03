# Instruções

Implementar uma aplicação que faça uma busca na API do twitter por menções da Locaweb para que possamos prover
suporte e iniciar protocolos pro pessoal que inicia reclamações no twitter.
Listar também os usuários que mais mencionam a locaweb.

A documentação do recurso de busca do twitter está em:

[https://dev.twitter.com/docs/api/1.1/get/search/tweets](https://dev.twitter.com/docs/api/1.1/get/search/tweets)

[https://dev.twitter.com/docs/platform-objects/tweets](https://dev.twitter.com/docs/platform-objects/tweets)

Para simplificar a autenticação do twitter e evitar limites vamos prover respostas mockadas da api de busca do twitter nesta url:
[http://tweeps.locaweb.com.br/](http://tweeps.locaweb.com.br/)

Para autenticar, envie um header HTTP chamado Username com o seu e-mail. Considere apenas os tweets retornados pela
primeira "página" do webservice, ou seja, não é necessário varrer os links de próximas páginas.

#### Queremos que a aplicação liste os tweets com as seguintes regras:
- buscar tweets que mencionem o usuário da Locaweb
- excluir tweets que sejam replies para tweets da locaweb (vamos fingir que estamos tratando apenas de casos novos e não de casos em andamento)
- Dar prioridade aos usuários com mais seguidores, tweets tenham mais retweets (considerar apenas o RT oficial do twitter) ou que o tweet seja favoritado mais vezes (todos os critérios com o mesmo peso) então estes tweets devem ser listados mais em cima na lista

Para efeito de testes, vamos considerar que usuário da locaweb no twitter tem o ID 42

#### Apresente os resultados com a ordenação acima e os campos:
- screen_name (@usuario) que fez o tweet (com link para o perfil)
- número de seguidores do autor, número retweets e favoritados do tweet
- conteúdo do tweet
- data/hora do tweet (com link para o tweet)
- Para a lista dos usuários que mais mencionam, agrege os dados dos tweets por usuário e aplique os mesmos critérios de ordenação acima.

Você está livre para usar qualquer versão do ruby/rails e framwork gems de sua escolha, apenas indique tudo isto
em seu Gemfile e/ou .ruby-version. Também queremos instruções de como rodar (sim, mandar executar um bundle
exec rails s e acessar [http://localhost:3000/](http://localhost:3000/) conta como instruções!​
