import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 1,
      max: 5,
      divisions: 4,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
