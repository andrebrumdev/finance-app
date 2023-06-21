import 'package:dio/dio.dart';
import 'package:finance_app_flutter/src/controllers/home_controller.dart';
import 'package:finance_app_flutter/src/models/bank_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropDownCustom extends StatefulWidget {
  DropDownCustom({Key key = const ValueKey('default'), this.title = ''}) : super(key: key);
  final String title;

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom>{
  final banksController = HomeController();

  Future<List<BancoModel>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return BancoModel.fromJSON(data);
    }

    return [];
  }
}

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: DropdownSearch<BancoModel>(
              asyncItems: (filter) => getData(filter)
            ),
          )
        ]
      ),
    );
  }
}