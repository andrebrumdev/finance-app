import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key = const ValueKey('default'), this.title = ''}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CardBank extends StatelessWidget{
  const CardBank({
    super.key,
    banco
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Image.network("https://www.google.com/s2/favicons?domain=${domain}&sz=${size}")
        ]
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context){
    // final response = http.get("https://raw.githubusercontent.com/guibranco/BancosBrasileiros/main/data/bancos.json");
    // Map<String, dynamic> _listOfBank = jsonDecode(awairesponse);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // children: _listOfBank.map((e) => CardBank(
          //   banco: e,
          //   key: e.COMPE,
          // ))
        ),
      ),
    );
  }
}