import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/myblog_title.dart';
import 'package:news_app/components/news_title.dart';
import 'package:news_app/components/category_title.dart';
import 'package:news_app/components/custom_app_bar.dart';
import 'package:news_app/helper/blogs.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/myblog_model.dart';
import 'package:news_app/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<ArticleModel> articles = new List<ArticleModel>.empty(growable: true);
  List<MyBlogModel> blogs = new List<MyBlogModel>.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  getDatas() async {
    News newsClass = News();
    Blogs blogsClass = Blogs();
    await blogsClass.getBlogs();
    blogs = blogsClass.blogs;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar().Create(context),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.black87,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    //Top Button
                    /*
                    Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryNews()));
                              },
                              icon: Icon(
                                Icons.videogame_asset,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Game News",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        )),
                    */
                    /*
                    Container(
                        
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryNews()));
                              },
                              icon: Icon(
                                Icons.videogame_asset,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Game News",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        )),
                    */
                    /// Categories
                    /*
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTitle(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    */
                    /// Blogs
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: blogs.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MyBlogTitle(
                            imageUrl: blogs[index].urlToImage,
                            title: blogs[index].title,
                            url: blogs[index].url,
                          );
                        },
                      ),
                    ),

                    /// News
                    /*
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTitle(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ),
    );
  }
}
