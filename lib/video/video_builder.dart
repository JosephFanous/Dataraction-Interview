import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  String videoId;
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
            SingleChildScrollView(child: comments()),
          ],
        ),
      ),
    );
  }

  Widget comments() {
    return Card(
      child: ExpansionTile(
        leading: Icon(
          Icons.comment,
          color: Colors.pinkAccent,
        ),
        title: Text(
          'Reviews',
        ),
        children: [
          ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (_, i) {
                return Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/user.png',
                          ),
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

  Widget video() {
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=fUv9gO8t8b4");
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
        return Container(
          child: player,
        );
      },
    );
  }
}
