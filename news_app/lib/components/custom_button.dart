import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? title;
  String? text;

  CustomButton({this.title,this.text});
  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        Center(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff1C1B1B).withOpacity(0.8),
              )),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white60, width: 1),
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
            child: Column(
              children: <Widget>[
                Text(
                  title!,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                text! =="" ? SizedBox(height: 0,) :
                Text(
                  text!,
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
