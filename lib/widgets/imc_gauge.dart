import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {
  const ImcGauge({
    Key? key,
    required this.imc,
  }) : super(key: key);

  final double imc;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showAxisLine: false,
          showLabels: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
              startValue: 12.5,
              endValue: 18.5,
              color: Colors.blue,
              label: 'Magreza',
            ),
            ImcGaugeRange(
              startValue: 18.5,
              endValue: 24.5,
              color: Colors.green,
              label: 'Normal',
            ),
            ImcGaugeRange(
              startValue: 24.5,
              endValue: 29.9,
              color: Colors.yellow,
              label: 'Sobrepeso',
            ),
            ImcGaugeRange(
              startValue: 29.9,
              endValue: 39.9,
              color: Colors.red,
              label: 'Obesidade',
            ),
            ImcGaugeRange(
              startValue: 39.5,
              endValue: 47.5,
              color: Colors.red,
              label: 'Obesidade morbida',
            )
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
