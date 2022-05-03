import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/image_view.dart';

import '../models/image_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  List<ImageModel>? images = new List<ImageModel>.empty(growable: true);

  CustomCarouselSlider({this.images});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 200,
        padding: EdgeInsets.only(bottom: 20),
        child: CarouselSlider.builder(
            itemCount: images!.length,
            itemBuilder: (context, index, realIndex) {
              var url = images![index].url;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageView(
                                imageUrl: url!,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.grey,
                  child: Image.network(
                    url!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(height: 400, autoPlay: true)));
  }
}
