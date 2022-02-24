import 'package:flutter/material.dart';
import 'package:youtube/apiYouTube.dart';
import 'screens/inicio.dart';
import 'screens/subscriptions.dart';
import 'screens/trending.dart';
import 'screens/userLibrary.dart';
import 'widgets/search.dart';

void main() {
  runApp(MaterialApp(
    home: mainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  ApiYouTube api = new ApiYouTube();
  String _searchResult = "";
  int _indexAtual = 0;


  @override
  Widget build(BuildContext context) {
    //Lista para fazer a troca entre as screens ao seleciona-las no bottomNavigationbar
    List<Widget> paginas = [
    inicio(_searchResult),
    trending(),
    subscriptions(),
    userLibrary(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        title: Image.asset(
          "assets/images/youtube.png",
          width: 100,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print("Press: VideoCam");
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                //Recebe a query pesquisada pelo usuário
                String? queryPesquisada =
                    await showSearch(context: context, delegate: Search());

                setState(() {
                  _searchResult = queryPesquisada!;
                });
              }),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("Press: Account");
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: paginas[_indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //indice selecionado
        currentIndex: _indexAtual,
        //Atualizar indice conforme clique do usuário
        onTap: (indexSelecioando) {
          setState(() {
            _indexAtual = indexSelecioando;
          });
        },
        //Usar type fixed para aparecer o label dos icones na bottomBar
        type: BottomNavigationBarType.fixed,
        //Determina a cor do item selecioando
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em alta",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Inscrições",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: "Biblioteca",
          ),
        ],
      ),
    );
  }
}
