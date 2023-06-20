import 'package:http/http.dart' as http;
import 'dart:convert';

class Banco{
  final String url;
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
      url: json['Url'],
      id: json['COMPE'],
      cnpj: json['Document'],
      name: json['LongName']
    );
  }

  toJson(){
    return{
      "id":id,
      "cnpj":cnpj,
      "name":name
    };
  }
}

void main() async{
  final List<Banco> listOfBanks = await getBancos();
  for (var bank in listOfBanks) {
    print(bank.toJson());
  }
}

Future getBancos() async{
  var url = Uri.tryParse('https://raw.githubusercontent.com/guibranco/BancosBrasileiros/main/data/bancos.json');
  var response = await http.get( url! );
  var json =  jsonDecode(response.body);
  var list = json as List;
  List<Banco> banks = [];
  for (var bank in list) {
    banks.add(new Banco.fromJSON(bank)); 
  }
  return banks;
}