import 'package:finance_app_flutter/src/models/bank_model.dart';
import 'package:finance_app_flutter/src/repositories/bank_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<BancoModel> banks = [];
  final BankRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);
  
  HomeController([BankRepository? repository])
  : _repository = repository ?? BankRepository();

  Future start() async{
    state.value = HomeState.loading;
    try{
      banks = await _repository.getAllBanks();
      state.value = HomeState.sucess;
    }
    catch(e){
      print(e);
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start , loading , sucess , error }