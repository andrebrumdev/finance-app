// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/services.dart';

class Banco{
  final Uri url;
  final String id;
  final String cnpj;
  final String name;

  Banco({
    required this.url,
    required this.id,
    required this.cnpj,
    required this.name
  });

  factory Banco.fromJSON(Map json){
    return Banco(
      url: Uri.parse(json['Url'] ?? ''),
      id: json['COMPE'],
      cnpj: json['Document'],
      name: json['LongName']
    );
  }

  toJson(){
    return{
      "id":id,
      "url":url,
      "cnpj":cnpj,
      "name":name,
      "icon":this.getIcon()
    };
  }

  getIcon({size=226}){
    return this.url.isAbsolute?'https://www.google.com/s2/favicons?domain=${this.url}&sz=${size}':false;
  }
}

void main() async{
  final List<Banco> listOfBanks = await getBancos();
  for (var bank in listOfBanks) {
    print(bank.toJson());
  }
}

Future getBancos() async{
  // var url = Uri.tryParse('https://raw.githubusercontent.com/guibranco/BancosBrasileiros/main/data/bancos.json');
  // var response = await http.get( url! ).body;
  var response = await rootBundle.loadString('assets/database/bancos.json');
  var json =  jsonDecode(response);
  var list = json as List;
  List<Banco> banks = [];
  for (var bank in list) {
    banks.add(new Banco.fromJSON(bank)); 
  }
  return banks;
}