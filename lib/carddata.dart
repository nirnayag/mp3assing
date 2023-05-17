import 'package:flutter/material.dart';


class Song {
  final String image;
  final String name;
  final String singerAlbum;


  Song({required this.name, required this.singerAlbum, required this.image});
}

class HorizontlCrd extends StatefulWidget {
  @override
  _HorizontlCrdState createState() => _HorizontlCrdState();
}

class _HorizontlCrdState extends State<HorizontlCrd> {
  List<Song> songs = [
    Song(
      name: 'Song 1',
      singerAlbum: 'Singer 1 / Album 1',
      image: 'https://japanpowered.com/media/images/tsuki-ga-kirei.jpg'
    ),
    Song(
      name: 'Song 2',
      singerAlbum: 'Singer 2 / Album 2',
      image: 'https://japanpowered.com/media/images/Tsuki-ga-Kirei-kiss.jpg'
    ),
    Song(
      name: 'Song 3',
      singerAlbum: 'Singer 3 / Album 3',
      image: 'https://1.bp.blogspot.com/-_92jRin9eMU/XvG8SGQkjiI/AAAAAAAAC-4/_RuJofM-NtcdSrpF-C5MkGKCeOhd-E-hQCLcBGAsYHQ/s1600/837703.jpg'
    ),
  ];

  List<bool> favoriteStatusList = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0, // No elevation to make it transparent
          color: Colors.transparent,
          child: Container(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(255, 203, 171, 171),
                    image: DecorationImage(
                  image: NetworkImage(songs[index].image),
                  fit: BoxFit.cover,
                ),
                  ),
                  // Replace this with your image widget
                  
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          songs[index].singerAlbum,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteStatusList[index] = !favoriteStatusList[index];
                    });
                  },
                  icon: Icon(
                    favoriteStatusList[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
