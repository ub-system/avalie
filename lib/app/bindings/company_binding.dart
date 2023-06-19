import 'package:avalie/app/controllers/company_controller.dart';
import 'package:get/get.dart';

import '../repositories/company_repository.dart';


class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CompanyRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(CompanyController(auth: Get.find(), repository: Get.find(), assessmentRepository: Get.find(), appUtils: Get.find(), assessmentController: Get.find()));
  }
}