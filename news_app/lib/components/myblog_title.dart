import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class MyBlogTitle extends StatelessWidget {
  final String? imageUrl, title, url;
  MyBlogTitle(
      {@required this.imageUrl, @required this.title, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(url);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      imageUrl!,
                    ),
                    Positioned(
                        top: -3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(7)),
                            child: Container(
                              color: Colors.black87,
                              padding: EdgeInsets.all(3),
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )))
                  ],
                )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
