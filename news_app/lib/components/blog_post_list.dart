import 'package:flutter/material.dart';
import 'package:news_app/components/myblog_title.dart';

import '../models/myblog_model.dart';

class BlogPostList extends StatelessWidget {
  List<MyBlogModel>? blogs = new List<MyBlogModel>.empty(growable: true);

  BlogPostList({this.blogs});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: blogs!.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return MyBlogTitle(
                imageUrl: blogs![index].urlToImage,
                title: blogs![index].title,
                url: blogs![index].url,
              );
            },
          ),
        ),
      ),
    );
  }
}
