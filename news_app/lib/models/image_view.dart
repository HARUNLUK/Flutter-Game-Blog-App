import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:news_app/components/custom_button.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;
  ImageView({required this.imageUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Stack(
              children: <Widget>[
                Hero(
                  tag: widget.imageUrl,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.contain,
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
                        onTap: () {
                          _save();
                        },
                        child: CustomButton(title: "Download",text: "Image will be saved in galery",)
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomButton(title: "Cancel",text: "",)
                        ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }

  _save() async {
    setState(() {
      _isLoading = true;
    });
    if (Platform.isAndroid) {
      await _askPermission();
    }
    await _askPermission();
    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    setState(() {
      _isLoading = false;
    });
  }

  _askPermission() async {
    if (Platform.isIOS) {
      Map<Permission, PermissionStatus> permissions =
          await [Permission.photos].request();
    } else {
      Map<Permission, PermissionStatus> permissions =
          await [Permission.storage].request();
    }
  }
}
