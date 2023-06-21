import 'package:finance_app_flutter/src/pages/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return MaterialApp(
      title: 'Brum Finances',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes:{
        '/':(context) => MyHomePage(title: 'App Finanças'),
      }
    );
  }
}

