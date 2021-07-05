import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titulo = 'App';

    return MaterialApp(
      title: titulo,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        unselectedWidgetColor: Colors.white,
      ),
      home: MyHomePage(title: titulo),
      debugShowCheckedModeBanner: false,
    );
  }
}