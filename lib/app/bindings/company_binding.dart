import 'package:avalie/app/repositories/company_repository.dart';
import 'package:get/get.dart';

class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyRepository(httpManager: Get.find(), appUtils: Get.find()));
  }
}