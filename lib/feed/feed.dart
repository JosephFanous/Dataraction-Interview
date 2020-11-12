import 'package:flutter/material.dart';
import 'feed_builder.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feed'),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FeedList();
            }));
  }
}
