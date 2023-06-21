import 'package:finance_app_flutter/src/models/bank_model.dart';
import 'package:finance_app_flutter/src/repositories/bank_repository.dart';

class HomeController {
  List<BancoModel> banks = [];
  final BankRepository _repository;
  HomeState state = HomeState.start;
  
  HomeController([BankRepository? repository])
  : _repository = repository ?? BankRepository();

  Future start() async{
    state = HomeState.loading;
    try{
      banks = await _repository.getAllBanks();
      state = HomeState.sucess;
    }
    catch(e){
      state = HomeState.error;
    }
  }
}

enum HomeState { start , loading , sucess , error }