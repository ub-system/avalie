import 'package:avalie/app/controllers/auth_controller.dart';
import 'package:avalie/app/models/assessment_model.dart';
import 'package:avalie/app/repositories/assessment_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routes/app_routes_pages.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';

class AssessmentController extends GetxController {
  final AuthController auth;
  final AssessmentRepository repository;
  final AppUtils appUtils;

  ValueNotifier<double> sliderValue = ValueNotifier<double>(1);

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  AssessmentController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;
  AssessmentModel assessment = AssessmentModel();

  // @override
  // void onInit() {
  //   super.onInit();

  //   getCompanies;
  // }

  Future post() async {
    isLoading.value = true;

    assessment.note = sliderValue.value.toInt();
    assessment.user = auth.user;
    String token = auth.user.token!;
    // print(user);

    ApiResult<AssessmentModel> result = await repository.insert(token: token, assessment: assessment);
    if (!result.isError) {
      assessment = result.data!;
      appUtils.showToast(message: "Company avaliada com sucesso!");
      Get.offAllNamed(AppRoutes.base);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}