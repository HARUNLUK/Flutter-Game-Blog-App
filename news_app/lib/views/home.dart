import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/components/blog_post_list.dart';
import 'package:news_app/components/custom_carousel_slider.dart';
import 'package:news_app/components/custom_app_bar.dart';
import 'package:news_app/helper/blogs.dart';
import 'package:news_app/helper/images.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/image_model.dart';
import 'package:news_app/models/myblog_model.dart';
import 'package:news_app/service/notification_service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NotificationService? notificationService;
  List<ArticleModel> articles = new List<ArticleModel>.empty(growable: true);
  List<MyBlogModel> blogs = new List<MyBlogModel>.empty(growable: true);
  List<ImageModel> images = new List<ImageModel>.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  getDatas() async {
    Blogs blogsClass = Blogs();
    await blogsClass.getBlogs();
    blogs = blogsClass.blogs;

    Images imagesClass = Images();
    await imagesClass.getImages();
    images = imagesClass.images;

    setState(() {
      _loading = false;
    });
  }

  sendNotification(int id, String title, String body){
      notificationService!.flutterLocalNotificationsPlugin.show(0, title, body, notificationService!.detail());
  }
  

  @override
  Widget build(BuildContext context) {
    notificationService = NotificationService(context: context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar().Create(context),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
            color: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                //TopImages
                CustomCarouselSlider(images:images),
                /// Blogs
                Text("Reviews", style: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w300),),
                SizedBox(height: 8,),
                BlogPostList(blogs: blogs,),

              ],
            ),
          ),
    );
  }
}
