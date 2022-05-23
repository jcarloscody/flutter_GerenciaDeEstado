import 'package:flutter/material.dart';
import 'package:ger/bloc_pattern/imc_bloc_pattern_page.dart';
import 'package:ger/change_notifier/change_notifier.dart';
import 'package:ger/setstate/imc_setstate_page.dart';
import 'package:ger/value_notifier/value_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _irParaPagina(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contexto) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _irParaPagina(context, const ImcSetstatePage());
              },
              child: const Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaPagina(context, const ImcValueNotifierPage());
              },
              child: const Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaPagina(context, const ImcChangeNotifierPage());
              },
              child: const Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaPagina(context, const ImcBlocPatternPage());
              },
              child: const Text('Bloc Pattern (Streams)'),
            ),
          ],
        ),
      ),
    );
  }
}
