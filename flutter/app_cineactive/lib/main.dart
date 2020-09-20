import 'package:flutter/material.dart';
import 'package:films/src/pages/home_page.dart';
import 'package:films/src/pages/film_detail.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Films',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => FilmDetail(), 

      },
    );
  }
}