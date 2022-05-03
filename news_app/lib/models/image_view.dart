import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {

  final String imageUrl;

  ImageView({required this.imageUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imageUrl, fit: BoxFit.contain,
            )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    _save();
                  },
                  child: Stack(children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2 ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                      )
                    ),
                    Container(
                    width: MediaQuery.of(context).size.width/2 ,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0x36FFFFFF),
                          Color(0x0FFFFFFF)
                        ]
                      )
                    ),
                    child: Column(children: <Widget>[
                      Text("Download Image", style: TextStyle(fontSize: 16, color: Colors.white70),),
                      Text("Image will be saved in galery", style: TextStyle(fontSize: 12, color: Colors.white70),)
                    ],),
                  ),
                  ],),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 17),
                )),
                SizedBox(height: 50,)
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async{
    if(Platform.isAndroid){
      await _askPermission();
    }
    await _askPermission();
    var response = await Dio().get(
      widget.imageUrl,
      options: Options(responseType: ResponseType.bytes)
    );
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async{
    if(Platform.isIOS){
      Map<Permission , PermissionStatus> permissions = await[
        Permission.photos
      ].request(); 
    }else{
      Map<Permission , PermissionStatus> permissions = await[
        Permission.storage
      ].request(); 
    }
  }
}