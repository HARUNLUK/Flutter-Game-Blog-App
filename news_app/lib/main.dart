import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black87,
      debugShowCheckedModeBanner: false,
      title: 'Harunluk Blog',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        primaryColor: Colors.black87,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("you have an error! "+'${snapshot.error.toString()}');
            return Text("something went wrong");
          }else if(snapshot.hasData){
            return Home();
          }else{
            return CircularProgressIndicator();
          };
        },
      ),
    );
  }
}
