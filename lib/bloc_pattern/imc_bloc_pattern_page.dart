import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:ger/bloc_pattern/imc_bloc_pattern_controller.dart';
import 'package:ger/bloc_pattern/imc_state.dart';
import 'package:intl/intl.dart';

import '../widgets/imc_gauge.dart';

class ImcBlocPatternPage extends StatefulWidget {
  const ImcBlocPatternPage({Key? key}) : super(key: key);

  @override
  State<ImcBlocPatternPage> createState() => _ImcBlocPatternPageState();
}

class _ImcBlocPatternPageState extends State<ImcBlocPatternPage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = ImcBlocPatternController();

  @override
  void dispose() {
    controller.dispose();
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
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ImcGauge(imc: snapshot.data?.imc ?? 0);
                    }
                    return const ImcGauge(imc: 0);
                  },
                ),
                const SizedBox(height: 20),
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: snapshot.data is ImcStateLoading,
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
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
                      controller.calculoImc(peso: peso, altura: altura);
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
