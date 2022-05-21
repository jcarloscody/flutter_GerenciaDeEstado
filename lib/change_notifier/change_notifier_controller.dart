import 'dart:math';

import 'package:flutter/cupertino.dart';

class ChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  void calcularIMC({required double peso, required double altura}) {
    imc = 0;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1));
    imc = peso / pow(altura, 2);
    notifyListeners();
  }
}
