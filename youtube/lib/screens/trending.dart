import 'package:flutter/material.dart';
import 'package:youtube/apiYouTube.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';
import 'package:youtube_api/youtube_api.dart';

class trending extends StatefulWidget {
  const trending({Key? key}) : super(key: key);

  @override
  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  Future<List<YouTubeVideo>> getVideos() async {
    ApiYouTube api = new ApiYouTube();
    Future<List<YouTubeVideo>> videoResults;
    videoResults = api.trends();
    return videoResults;
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
              break;

            case ConnectionState.waiting:
              print("Conexão Status: waiting");
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.active:
              print("Conexão Status: active");
              break;

            case ConnectionState.done:
              print("Conexão Status: done");
              //tratar o erro se existir
              if (snapshot.hasError) {
                print("Erro ao obter os dados...${snapshot.error.toString()}");
              } else if (snapshot.hasData) {
                print("Tem dados");

                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    //Lista dos videos
                    List<YouTubeVideo>? videos = snapshot.data;
                    //Cria Objeto Video
                    YouTubeVideo video = videos![index];

                    return ListTile(
                      title: Text(video.title),
                      subtitle: Text(video.description.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      color: Colors.grey,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                print("Nenhum dado a ser exibido");
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              break;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
