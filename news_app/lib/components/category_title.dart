
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/category_news.dart';

class CategoryTitle extends StatelessWidget {
  
  final String ?imageUrl, categoryName;
  CategoryTitle({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>
            CategoryNews()
          ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage
            (
              imageUrl: imageUrl!, width: 120, height: 60, fit: BoxFit.cover,
            )
          ),
          Container(
            alignment: Alignment.center,
            width: 120, height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(categoryName!, style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          )
        ]),
      ),
    );
  }
}