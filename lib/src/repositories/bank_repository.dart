
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finance_app_flutter/src/models/bank_model.dart';

class BankRepository {
  final dio = Dio();
  final url = 'http://192.168.0.100:4000/bank';

  Future<List<BancoModel>> getAllBanks() async{
    var json = await dio.get(url).then((value) => value.data);
    final list = json['json'] as List;
    final List<BancoModel> banks = [];
    for (var bank in list) {
      banks.add(new BancoModel.fromJSON(bank)); 
    }
    return banks;
  }

  Future<List<BancoModel>> getBanks(filter) async {
    var json = await dio.get(url, queryParameters: {"filter": filter}).then((value) => value.data);
    final list = json['json'] as List;
    final List<BancoModel> banks = [];
    for (var bank in list) {
      banks.add(new BancoModel.fromJSON(bank)); 
    }
    return banks;
  }

}