import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:ger/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ImcSetstatePage extends StatefulWidget {
  const ImcSetstatePage({Key? key}) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  var imc = 0.0;
  final formKey = GlobalKey<FormState>();

  void _calcularIMC({required double peso, required double altura}) {
    setState(() {
      imc = 0;
    });
    Future.delayed(Duration(seconds: 1));
    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  void dispose() {
    alturaEC.dispose();
    pesoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc SetState'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ImcGauge(imc: imc),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Peso'),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso Obrigatório';
                    }
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura'),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Altura obrigatória!';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValidacao =
                        formKey.currentState?.validate() ?? false;
                    if (formValidacao) {
                      var formatter = NumberFormat.simpleCurrency(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                      );
                      var peso = formatter.parse(pesoEC.text) as double;
                      var altura = formatter.parse(alturaEC.text) as double;
                      _calcularIMC(
                        peso: peso,
                        altura: altura,
                      );
                    }
                  },
                  child: const Text('Calcular IMC'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
