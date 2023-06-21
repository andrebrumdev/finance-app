import 'package:finance_app_flutter/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key = const ValueKey('default'), this.title = ''})
      : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class CardBank extends StatelessWidget {
  const CardBank({super.key, banco});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // Image.network("https://www.google.com/s2/favicons?domain=${domain}&sz=${size}")
      ]),
    );
  }
}

class _HomePageState extends State<HomePage> {
  final banksController = HomeController();

  _success() {
    return ListView.builder(
      itemCount: banksController.banks.length,
      itemBuilder: (context, index) {
        final bank = banksController.banks[index];
        final icon = bank.getIcon();
        print(icon.toString());

        return ListBody(
          children: <Widget>[
            Image.network(
              icon.toString(),
              width: 256,
              height: 256,
              loadingBuilder: (context, child, loadingProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorBuilder: (context, error, stackTrace) =>
                  Text('Falha ao carregar'),
            ),
            Text(bank.name),
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
