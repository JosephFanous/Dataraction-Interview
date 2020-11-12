import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  String videoId = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=fUv9gO8t8b4");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            video(),
            comments(),
            SizedBox(
              height: 25,
            ),
            otherVideos(),
          ],
        ),
      ),
    );
  }


  //Builds Youtube video and if its Landscape, it should be able to re-scale but not working
  Widget video() {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressColors: ProgressBarColors(
            playedColor: Colors.amber, handleColor: Colors.amberAccent),
      ),
      builder: (context, player) {
        return Container(child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            return Scaffold(
              body: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: YoutubePlayer(
                      controller: _controller,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: YoutubePlayer(
                    controller: _controller,
                  ),
                ),
              ),
            );
          }
        }));
      },
    );
  }

  //Comment section to the video being watched

  Widget comments() {
    return Card(
      child: ExpansionTile(
        leading: Icon(
          Icons.comment,
          color: Colors.lightGreen,
        ),
        title: Text(
          'Comments',
        ),
        children: [
          ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/user.png',
                          ),
                        ),
                        Text('J.F.'),
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.thumbsUp, size: 15),
                              onPressed: () => print('Like'),
                            ),
                            IconButton(
                              icon:
                                  FaIcon(FontAwesomeIcons.thumbsDown, size: 15),
                              onPressed: () => print('Dislike'),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                          'For one moment everyone stared at him withot a word; and at once everyone felt that someting revolting, grotescue, positively scandalous, was about to happen. Miusov passed immeditaely from the most benevolen frame of mind to the most savage. All the feelings that had subsided and died down in his heart revived instantly.'),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }

  //Builds a recommended video list based off the tags within the video
  //you are currently watching and have watched in the past
  Widget otherVideos() {
    return Container(
      child: Column(
        children: [
          Text(
            'Recommended Videos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                    child: Container(
                      height: 200,
                      width: 150,
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
                  ),
                );
              }),
        ],
      ),
    );
  }
}
