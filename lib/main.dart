import 'package:finance_app_flutter/pages/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return MaterialApp(
      title: 'First Teste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'App Finanças'),
    );
  }
}

