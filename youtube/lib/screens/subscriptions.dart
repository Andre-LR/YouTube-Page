import 'package:flutter/material.dart';
import 'package:youtube/widgets/youtubeAppBar.dart';

class subscriptions extends StatefulWidget {
  const subscriptions({Key? key}) : super(key: key);

  @override
  _subscriptionsState createState() => _subscriptionsState();
}

class _subscriptionsState extends State<subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Inscrições",
          style: TextStyle(
            fontSize: 20
          ),
        )
      ),
    );
  }
}
