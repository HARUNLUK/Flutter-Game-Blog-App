import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:news_app/models/image_model.dart';

class Images{
  List<ImageModel> images = [];
  
  Future<void> getImages () async{
    
    DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = await _testRef.child("images").get();
    var imagesData = await json.decode(json.encode(snapshot.value));

    imagesData.forEach((obj){
      ImageModel blogModel = new ImageModel(
        url: obj["url"],
      );
      images.add(blogModel);
    });
    
  }
}
