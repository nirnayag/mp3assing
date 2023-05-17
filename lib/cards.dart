import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:typed_data';

import 'modal.dart';

class PopCard extends StatefulWidget {
  final DataItem data;
  final String musicAssetPath; // Add the musicAssetPath parameter here

  const PopCard({
    Key? key,
    required this.data,
    required this.musicAssetPath,
  }) : super(key: key);

  @override
  State<PopCard> createState() => _PopCardState();
}

class _PopCardState extends State<PopCard> {
  late AudioPlayer audioPlayer;
  final AudioCache audioCache = AudioCache();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.STOPPED) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playMusic(String musicAssetPath) async {
    if (isPlaying) {
      await audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } else {
      if (musicAssetPath.isNotEmpty) {
        final ByteData data = await rootBundle.load(musicAssetPath);
        final Uint8List bytes = data.buffer.asUint8List();
        await audioPlayer.playBytes(bytes);
        setState(() {
          isPlaying = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff3d2892),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'The Dark Side',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text(
                                  'Music - Similution hteary',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        PlayBtn(
                          musicAssetPath: widget.musicAssetPath,
                          playMusic: playMusic,
                          isPlaying: isPlaying,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayBtn extends StatelessWidget {
  final String musicAssetPath;
  final Function(String) playMusic;
  final bool isPlaying;

  const PlayBtn({
    Key? key,
    required this.musicAssetPath,
    required this.playMusic,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        playMusic(musicAssetPath);
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(8.0),
        primary: Colors.white,
      ),
      child: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.black,
        size: 30.0,
      ),
    );
  }
}

class ListofCard extends StatefulWidget {
  const ListofCard({Key? key});

  @override
  State<ListofCard> createState() => _ListofCardState();
}

class _ListofCardState extends State<ListofCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = dataList[index];
        final musicAssetPath = 'assets/music${index + 1}.mp3';

        return PopCard(
          data: data,
          musicAssetPath: musicAssetPath,
        );
      },
      itemCount: dataList.length,
      scrollDirection: Axis.horizontal,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: ListofCard(),
    ),
  ));
}
