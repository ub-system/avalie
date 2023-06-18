import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/assessment_controller.dart';

class SliderAssessmentWidget extends StatefulWidget {
  const SliderAssessmentWidget({Key? key}) : super(key: key);

  @override
  _SliderAssessmentWidgetState createState() => _SliderAssessmentWidgetState();
}

class _SliderAssessmentWidgetState extends State<SliderAssessmentWidget> {
  final AssessmentController controller = Get.find<AssessmentController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: controller.sliderValue,
      builder: (context, value, _) {
        return Slider(
          value: value,
          min: 1,
          max: 5,
          divisions: 4,
          onChanged: (double newValue) {
            setState(() {
              controller.updateSliderValue(newValue);
            });
          },
        );
      },
    );
  }
}
