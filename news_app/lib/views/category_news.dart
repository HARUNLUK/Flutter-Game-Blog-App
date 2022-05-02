import 'package:flutter/material.dart';
import 'package:news_app/components/news_title.dart';
import 'package:news_app/components/custom_app_bar.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
class CategoryNews extends StatefulWidget {

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  
  List<ArticleModel> articles = new List<ArticleModel>.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews()async{
    News newsClass = News();
    await newsClass.getNews("");
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().NewsBar(),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
               Container(
                  padding: EdgeInsets.only(top: 16),
                  child:  ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return NewsTitle(imageUrl: articles[index].urlToImage, title: articles[index].title, url: articles[index].url,);
                    },
                  ),
                ),
        
            ],
          ),
        ),
      ),
    );
  }
}