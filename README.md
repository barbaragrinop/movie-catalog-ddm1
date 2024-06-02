# TP (P2) de DDM1 - FatecFlix - Aplicativo de catálogo de filmes 

## FatecFlix - Aplicativo de Catálogo de Filmes

Em grupos de até 4 alunos, desenvolver o projeto de um aplicativo em Flutter/DART de catálogo de filmes e entregá-lo até a data informada abaixo, atentando-se aos requisitos disponíveis a seguir.

O objetivo do aplicativo é permitir que o usuário visualize as principais informações sobre filmes, como título, sinopse, elenco principal, ano de lançamento e gênero.

Principais requisitos do projeto:

- O aplicativo deve ter uma página inicial que exiba uma lista de filmes populares. Utilize um componente ListView para mostrar os filmes em forma de cards, exibindo a imagem do filme, o título e o ano de lançamento.
- Os usuários devem ser capazes de clicar em um filme da lista para visualizar os detalhes completos. Crie uma nova página ou tela que exiba todas as informações disponíveis sobre o filme, incluindo o elenco principal, a sinopse e o gênero.
- Os filmes devem ser armazenados apenas em memória ou localmente. Para isso, utilize Listas, Mapas  ou Shared Preferences. Não é necessário gravar em BD; se decidir usar, opte pelo SQLite (conforme disponível no arquivo "DDM1 - ISW-011 - Aula 12.pdf", do material de aula, no qual também consta sobre Shared Preferences).
- Acrescente uma funcionalidade para filtrar os filmes por gênero. Utilize um componente DropDownButton para exibir a lista de gêneros disponíveis e atualize a lista de filmes populares de acordo com o gênero selecionado pelo usuário.
- Implemente uma funcionalidade de paginação para permitir que o usuário veja mais filmes além daqueles exibidos inicialmente. Utilize um componente PageView para criar a navegação entre páginas de filmes.
- Utilize Stateful Widgets para gerenciar o estado do aplicativo, como a lista de filmes, a pesquisa e os favoritos.
- Personalize o design do aplicativo com cores, fontes e estilos adequados. Utilize componentes como TextField, Image, ListView, PageView, Menus/Navegação e DropDownButton para criar a interface do usuário.
