import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CarouselComponent extends StatelessWidget{

  CarouselComponent({@required this.images});

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: images.map((item) =>
        Container(
          child: Image.network(item, fit: BoxFit.cover, width: 1200,),
        )
      ).toList(),
    );
  }

}