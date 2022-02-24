import 'package:flutter/material.dart';

//Classe SearchDelegate configua para que o termo "query" seja o termo que o usuário esta digitando na barra de pesquisa
class Search extends SearchDelegate<String> {
  List<String> _searchHistory = [
    "flutter",
    "devops",
    "dart",
    "mobile",
  ];

  void _addSearchItem(String item) {
    //Adiciona o item como mais recente do histórico
    if (_searchHistory.contains(item)) {
      //Colocar item como mais recente removendo-o e adicionando-o denovo
      _deleteFromHistory(item);
      _addSearchItem(item);
    } else {
      _searchHistory.add(item);
    }

    //Adiciona na sugestões caso não haja na lista de sugestões
    if (!_searchSuggestions.contains(item)) {
      _searchSuggestions.add(item);
    }
  }

  void _deleteFromHistory(String item) {
    _searchHistory
        .removeWhere((element) => element.toLowerCase() == item.toLowerCase());
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      //Botão para limpar barra de pesquisa
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Leading icon que fica no canto esquerdo da barra de pesquisa
    IconButton(
        onPressed: () {
          return close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Resultado da pesquisa, passando a query através do "showSearch"
    // Coloca a query pesquisada no histórico, e nas sugestões
    _addSearchItem(query);
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Sugestões que aparecem conforme usuário digita
    //Se digitar mostra lista de sugestões que começam com o input informado
    //Se a lista de sugestões estiver vazia, mostra "Nenhuma sugestão para a pesquisa"
    //Se o usuário não digitar nada, mostra o histórico
    List<String> suggestionList = [];
    if (query != null && query.isNotEmpty) {
      suggestionList = _searchSuggestions
          .where((termo) => termo.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      if (suggestionList.isEmpty) {
        return Center(
          child: Text("Nenhuma sugestão para a pesquisa"),
        );
      }
    } else {
      //colocar histórico de pesquisa em ordem do mais recente ao mais antigo
      suggestionList = _searchHistory.reversed.toList();
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          trailing: IconButton(
            onPressed: () {
              _deleteFromHistory(suggestionList[index].toString());
            },
            icon: Icon(Icons.clear),
          ),
          //Ao clicar, a sugestão escolhida é passado ao "showSearch" e é pesquisada
          onTap: () {
            _addSearchItem(suggestionList[index].toString());
            close(context, suggestionList[index].toString());
          },
        );
      },
      itemCount: suggestionList.length,
    );
  }







  List<String> _searchSuggestions = [
    "inter",
    "internacional",
    "brasil",
    "copa",
    "gauchão",
    "libertadores",
    "Bailarina",
    "Futebol",
    "Estátua",
    "Pintor",
    "Frio",
    "Bebê",
    "Mímico",
    "Escova de dentes",
    "Lápis",
    "Livro",
    "Astronauta",
    "Amor",
    "Ódio",
    "Cego",
    "Cadeira",
    "Sacola",
    "Professor",
    "Médico",
    "Calculadora",
    "Artista",
    "Vitória",
    "Pescador",
    "Internet",
    "Basquete",
    "Semente",
    "Policial",
    "Amargo",
    "Bilhete",
    "Xadrez",
    "Banana",
    "Micróbio",
    "Romance",
    "Carteira",
    "Máquina de lavar",
    "Prancha de surfe",
    "Debate",
    "Lixo",
    "Sombra",
    "Cadeado",
    "Massagem",
  ];
}
