import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:youtube_api/youtube_api.dart';

import 'models/video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyBIE1BW5_IUbb167uuCAKGlhgIRRSItS6c';


class ApiYouTube {
  YoutubeAPI YT_API = YoutubeAPI(CHAVE_YOUTUBE_API);
  List<YouTubeVideo> videoResults = []; //Armazena os videos "brutos" com  todos os dados vindos direto da API
  List<Video> videoList = []; //Armazena os videos criados com a classe

  search(String search) async {
    //Será armazenado na lista todos os videos da consulta realizada 
    videoResults = await YT_API.search(
      search, //Passa a query do usuário como parâmetro de pesquisa
      order: 'relevance',
      videoDuration: 'any',
    );

    for (YouTubeVideo video in videoResults) {
      print("""
Titulo: ${video.title}
Duração: ${video.duration}
""");

      Video _video = new Video(
          title: video.title,
          description: video.description.toString(),
          thumbnail: video.thumbnail.toString(),
          channel: video.channelTitle.toString());

      videoList.add(_video);
    }
  }

  Future<List<YouTubeVideo>> trends() async {
    String _regionCode = "BR";

    return videoResults = await YT_API.getTrends(regionCode: _regionCode);
  }
}
