import 'package:avalie/app/repositories/assessment_repository.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssessmentRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(ProfileController(auth: Get.find()));
  }
}