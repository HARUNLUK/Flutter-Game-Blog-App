import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:news_app/models/myblog_model.dart';

class Blogs{
  List<MyBlogModel> blogs = [];
  
  Future<void> getBlogs () async{
    
    DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = await _testRef.child("blogs").get();
    var blogsData = await json.decode(json.encode(snapshot.value));

    blogsData.forEach((obj){
      MyBlogModel blogModel = new MyBlogModel(
        title: obj["title"],
        url: obj["url"],
        urlToImage: obj["imageUrl"],
      );
      blogs.add(blogModel);
    });
    
  }
}
