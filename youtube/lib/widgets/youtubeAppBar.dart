import 'package:flutter/material.dart';

PreferredSizeWidget ? YoutubeAppBar() {
  return AppBar(
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
          onPressed: () {
            print("Press: Search");
          }),
      IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            print("Press: Account");
          }),
    ],
  );
}
