import 'dart:convert';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

import 'package:finance_app_flutter/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key = const ValueKey('default'), this.title = ''}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final banksController = HomeController();
  _success() {
    _launchURL(_url) async {
        if(_url.hasAuthority)
          await launchUrl(_url);
    }

    return ListView.builder(
      itemCount: banksController.banks.length,
      itemBuilder: (context, index) {
        final bank = banksController.banks[index];
        Uint8List decodedBytes = base64Decode(bank.icon ?? '');
        return ListBody(
          children: <Widget>[
            InkWell(
              onTap: () => {_launchURL(bank.url)},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.memory(
                        decodedBytes,
                        width: 16,
                        height: 16,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bank.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () => {banksController.start()},
        child: Text('Tentar Novamente'),
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.sucess:
        return _success();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      default:
        return Container();
    }
  }

  @override
  initState() {
    super.initState();
    banksController.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
          animation: banksController.state,
          builder: (context, child) {
            return stateManagement(banksController.state.value);
          }),
    );
  }
}
