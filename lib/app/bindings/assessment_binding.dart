import 'package:avalie/app/controllers/assessment_controller.dart';
import 'package:avalie/app/repositories/assessment_repository.dart';
import 'package:get/get.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssessmentRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(AssessmentController(auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}