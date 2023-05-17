import 'package:flutter/material.dart';

class CardData {
  final String imageUrl;
  final String title;
  final String subtitle;

  CardData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class SearchCards extends StatelessWidget {
  final List<CardData> cards = [
     CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/6/88184l.jpg',
      title: 'Card 1',
      subtitle: 'Subtitle 1',
    ),
    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/8/85941l.jpg',
      title: 'Card 2',
      subtitle: 'Subtitle 2',
    ),
     CardData(
      imageUrl: 'https://static.wikia.nocookie.net/kiminonawa/images/6/62/Kimi-no-Na-wa.-Visual.jpg/revision/latest?cb=20160927170951',
      title: 'Card 3',
      subtitle: 'Subtitle 1',
    ),

    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/5/89855l.jpg',
      title: 'Card 4',
      subtitle: 'Subtitle 1',
    ),

    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/3/67177l.jpg',
      title: 'Card 5',
      subtitle: 'Subtitle 1',
    ),

    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/5/60465l.jpg',
      title: 'Card 6',
      subtitle: 'Subtitle 1',
    ),

    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/8/75643l.jpg',
      title: 'Card 7',
      subtitle: 'Subtitle 1',
    ),

    CardData(
      imageUrl: 'https://cdn.myanimelist.net/images/anime/3/72831l.jpg',
      title: 'Card 8',
      subtitle: 'Subtitle 1',
    ),
    // Add more card data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 150 / 200, // Width-to-height ratio of each card
      ),
      itemBuilder: (context, index) {
        final card = cards[index];
        return Container(
         
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:175,
                  width: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), 
                    child: Image.network(
                      card.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  card.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.white
                  ),
                ),
                Text(
                  card.subtitle,
                  style: TextStyle(
                color: Colors.white,fontSize: 15,
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
