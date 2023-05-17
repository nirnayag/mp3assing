import 'package:flutter/material.dart';



class DataItem {
  final String image;
  final String musicAsset;
  final Color textColor;
  final int index;

  DataItem({
    required this.image,
    required this.musicAsset,
    required this.textColor,
    required this.index
  }); 
}

final List<DataItem> dataList = [
  DataItem(
    image: 'https://image.lexica.art/full_jpg/02b4aa01-16c2-44a1-a02b-6892290fd85c',
    musicAsset: 'music1.mp3',
    textColor: Colors.blue,
    index: 0,
  ),
  DataItem(
    image: 'https://cdnb.artstation.com/p/assets/images/images/032/052/815/large/muzenik-art-d0a87817-0ae1-45f3-8860-17b53cedb0c1.jpg?1605333325',
    musicAsset: 'music2.mp3',
    textColor: Colors.green,
    index: 1,
  ),
  DataItem(
    image: 'https://image.lexica.art/full_jpg/01b6db6f-9517-48d2-8917-1519b4a206ea',
    musicAsset: 'music3.mp3',
    textColor: Colors.red,
    index: 2,
  ),
];
