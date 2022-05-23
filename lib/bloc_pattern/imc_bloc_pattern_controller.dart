import 'dart:async';
import 'dart:math';

import 'package:ger/bloc_pattern/imc_state.dart';

class ImcBlocPatternController {
  final _imcStremController = StreamController<ImcState>.broadcast() 
    ..add(ImcState(imc: 0));

  //porta de saida
  Stream<ImcState> get imcOut => _imcStremController.stream;

  Future<void> calculoImc({
    required double peso,
    required double altura,
  }) async {
    _imcStremController.add(ImcStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    final imc = peso / pow(altura, 2);
    _imcStremController.add(ImcState(imc: imc));
  }

  //outra forma de fazer: normalmente criamos o Sink quando externalizamos a chamada, mas neste escolhemos em deixar os itens privados _imcStremController
  //ou seja, ninguém irá conseguir adicionar nada a não ser pela controller, isto é uma boa prática.
  //mas pode externalizar com o Sink
  Sink<ImcState> get imcIn => _imcStremController.sink;
  Future<void> calculoImc2({
    required double peso,
    required double altura,
  }) async {
    imcIn.add(ImcState(imc: 0));
    await Future.delayed(const Duration(seconds: 1));
    final imc = peso / pow(altura, 2);
    imcIn.add(ImcState(imc: imc));
  }

  void dispose() {
    _imcStremController.close();
  }
}
