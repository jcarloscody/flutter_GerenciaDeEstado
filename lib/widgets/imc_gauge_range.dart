import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {
  ImcGaugeRange({
    required super.startValue,
    required super.endValue,
    required Color color,
    required String label,
  }) : super(
          color: color,
          label: label,
          sizeUnit: GaugeSizeUnit.factor,
          startWidth: 0.65,
          endWidth: 0.65,
        );
}
