import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social/profile/profile.dart';
import '../video/video_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  int numComments;
  int numRetweets;
  int numLikes = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Column(
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/user.png',
                ),
                radius: 30,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              ),
            ),
          ],
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/thumb.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayer()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoPlayer()),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      _share();
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        _favorite();
                      });
                    },
                  ),
                  Text('$numLikes'),
                ]),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future<Widget> _share() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text(
                'How would you like to share?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black),
                  child: Row(
                    children: [
                      SimpleDialogOption(
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                        ),
                      ),
                      SimpleDialogOption(
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                      ),
                      SimpleDialogOption(
                        child: FaIcon(
                          FontAwesomeIcons.snapchat,
                          color: Colors.yellow,
                        ),
                      ),
                      SimpleDialogOption(
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _favorite() {
    numLikes += 1;
  }
}
