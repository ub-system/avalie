import 'package:avalie/app/controllers/auth_controller.dart';
import 'package:avalie/app/models/company_model.dart';
import 'package:get/get.dart';

import '../core/routes/app_routes_pages.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../repositories/company_repository.dart';

class CompanyController extends GetxController {
  final AuthController auth;
  final CompanyRepository repository;
  final AppUtils appUtils;

  CompanyController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;
  CompanyModel company = CompanyModel();

  // @override
  // void onInit() {
  //   super.onInit();

  //   //getCompanies;
  // }

  Future post() async {
    isLoading.value = true;

    // print(user);

    ApiResult<CompanyModel> result = await repository.insert(company);
    if (!result.isError) {
      company = result.data!;
      appUtils.showToast(message: "Company cadastrada com sucesso!");
      Get.offAllNamed(AppRoutes.login);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}