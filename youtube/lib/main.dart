import 'package:flutter/material.dart';
import 'package:youtube/apiYouTube.dart';
import 'screens/homePage.dart';
import 'screens/subscriptions.dart';
import 'screens/trending.dart';
import 'screens/userLibrary.dart';
import 'widgets/youtubeAppBar.dart';

void main() {
  runApp(MaterialApp(
    home: mainPage(),
  ));
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  ApiYouTube api = new ApiYouTube();

  List<Widget> paginas = [
    homePage(),
    trending(),
    subscriptions(),
    userLibrary(),
  ];

  int _indexAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YoutubeAppBar(),
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
