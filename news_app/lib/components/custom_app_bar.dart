import 'package:flutter/material.dart';
import 'package:news_app/views/category_news.dart';

class CustomAppBar extends AppBar {
  AppBar Create(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: Stack(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "HARUN",
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            Text(
              "LUK",
              style: TextStyle(color: Colors.blue),
            ),
          ]),
          Positioned(
              right: 0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => 
                            CategoryNews()
                        )
                      );
                  },
                  child: Icon(Icons.newspaper)))
        ],
      ),
      elevation: 0.0,
      centerTitle: true,
    );
  }

  AppBar NewsBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white38, //change your color here
      ),
      backgroundColor: Colors.black87,
      title:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(
          "HARUN",
          style: TextStyle(
            color: Colors.white38,
          ),
        ),
        Text(
          "LUK",
          style: TextStyle(color: Colors.blue),
        )
      ]),
      actions: <Widget>[
        Opacity(
          opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.save),
          ),
        )
      ],
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
