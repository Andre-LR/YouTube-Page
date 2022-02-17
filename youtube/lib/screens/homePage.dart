import 'package:flutter/material.dart';
import 'package:youtube/apiYouTube.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';
import 'package:youtube_api/youtube_api.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future<List<YouTubeVideo>> getVideos() async {
    ApiYouTube api = new ApiYouTube();
    Future<List<YouTubeVideo>> videosResults = api.searchVideo("");
    return videosResults;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YouTubeVideo>>(
      future: getVideos(),
      builder: (context, snapshot) {
        //Controle da conexão
        switch (snapshot.connectionState) {
          //Executa determinada função na página de acordo com o status
          case ConnectionState.none:
            print("Conexão Status: none");
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.waiting:
            print("Conexão Status: waiting");
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.active:
            print("Cnexão Status: Active");
            break;

          case ConnectionState.done:
            print("Cnexão Status: Done");

            if (snapshot.hasError) {
              print("Erro ao obter os dados...${snapshot.error.toString()}");
              return Center(
                child: Text("Erro ao obter os dados"),
              );
            } else if (snapshot.hasData) {
              print("Dados recuperados com sucesso");

              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (context, index) {
                  //Recupera lista os videos do snapshot
                  List<YouTubeVideo>? videos = snapshot.data;
                  //Cria objeto video para manipulação
                  YouTubeVideo video = videos![index];

                  //Cria layout pagina a ser mostrado
                  return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: [
                          //Thumbnail
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        video.thumbnail.medium.url.toString()),
                                    fit: BoxFit.cover)),
                          ),
                          //Titulo e Informações do video
                          ListTile(
                            title: Text(video.title),
                            subtitle: Text(video.channelTitle),
                          )

                        ],
                      )
                    );
                },
              );
            } else {
              print("Nenhum dado a ser exibido");
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
        }
        return Container();
      },
    );
  }
}
