import 'package:flutter/material.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';


class trending extends StatefulWidget {
  const trending({ Key? key }) : super(key: key);

  @override
  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Em alta",
        style: TextStyle(
          fontSize: 20
        ),
      )),
    );
  }
}