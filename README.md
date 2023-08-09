# Pokedex MVVM App

Este é um aplicativo Pokedex desenvolvido em SwiftUI e seguindo a arquitetura MVVM (Model-View-ViewModel). Ele usa a API PokeAPI (https://pokeapi.co/) para obter informações sobre os Pokémon da 1ª geração.

## Recursos

- Tela principal com lista de todos os Pokémon da 1ª geração.
- Barra de pesquisa que filtra os Pokémon pelo nome.
- Detalhes do Pokémon exibidos ao clicar em um Pokémon na lista.

## Capturas de Tela
<img src="https://github.com/AlexParreira/Pokedex-MVVM/assets/41374999/f900169c-773b-4862-9c86-080e71f8915e" alt="Captura de Tela 1" width="300" height="700">
<img src="https://github.com/AlexParreira/Pokedex-MVVM/assets/41374999/19a474ae-13d3-4cfe-9065-c809308089a5" alt="Captura de Tela 1" width="300" height="700">
<img src="https://github.com/AlexParreira/Pokedex-MVVM/assets/41374999/7e487feb-d1f8-4985-8777-ae2201552a52" alt="Captura de Tela 1" width="300" height="700">



## Arquitetura MVVM

O aplicativo segue a arquitetura MVVM para separar a lógica de negócios da interface do usuário. Ele consiste em três partes principais:

- **Model**: Contém a estrutura de dados, como o `Pokemon` e outros modelos de dados relacionados.
- **View**: Exibe a interface do usuário e interage com o ViewModel por meio de ligações de dados. A tela principal exibe a lista de Pokémon e a barra de pesquisa.
- **ViewModel**: Gerencia os dados e a lógica de negócios. Faz as chamadas à API PokeAPI, filtra os Pokémon e fornece os dados à View.

## Instalação

1. Clone este repositório.
2. Abra o projeto no Xcode.
3. Execute o aplicativo em um simulador ou dispositivo iOS.


## Como Contribuir

Se você deseja contribuir com melhorias, correções ou novos recursos para este aplicativo, sinta-se à vontade para abrir uma issue ou enviar um pull request.


