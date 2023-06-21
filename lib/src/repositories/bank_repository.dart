
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finance_app_flutter/src/models/bank_model.dart';

class BankRepository {
  final dio = Dio();
  final url = 'https://raw.githubusercontent.com/andrebrumdev/finance-app/main/assets/database/bancos.json';

  Future<List<BancoModel>> getAllBanks() async{
    var json = await dio.get( url );
    final list = jsonDecode(json.data) as List;
    
    final List<BancoModel> banks = [];
    for (var bank in list) {
      banks.add(new BancoModel.fromJSON(bank)); 
    }
    return banks;
  }

}