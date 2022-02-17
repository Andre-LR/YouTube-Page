import 'package:flutter/material.dart';
import 'package:youtube/apiYouTube.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  ApiYouTube api = new ApiYouTube();
  List<Video> videoList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
        child: TextField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Search...",
            border: OutlineInputBorder(),
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          api.search(_searchController.text);
        },
        child: Text("Inicio"),
      ),
      
    ]);
  }
}
