import 'package:flutter/material.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';


class userLibrary extends StatefulWidget {
  const userLibrary({ Key? key }) : super(key: key);

  @override
  _userLibraryState createState() => _userLibraryState();
}

class _userLibraryState extends State<userLibrary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Biblioteca",
        style: TextStyle(
          fontSize: 20
        ),
      )),
    );
  }
}