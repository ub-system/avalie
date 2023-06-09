import 'package:avalie/app/controllers/auth_controller.dart';
import 'package:avalie/app/models/assessment_model.dart';
import 'package:avalie/app/models/company_model.dart';
import 'package:avalie/app/repositories/assessment_repository.dart';
import 'package:get/get.dart';

import '../core/routes/app_routes_pages.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../repositories/company_repository.dart';
import 'assessment_controller.dart';

class CompanyController extends GetxController {
  final AuthController auth;
  final CompanyRepository repository;
  final AssessmentRepository assessmentRepository;
  final AssessmentController assessmentController;
  final AppUtils appUtils;

  CompanyController({
    required this.auth,
    required this.repository,
    required this.appUtils,
    required this.assessmentRepository,
    required this.assessmentController,
  });

  RxBool isLoading = false.obs;
  CompanyModel company = CompanyModel();
  AssessmentModel assessment = AssessmentModel();
  RxList<CompanyModel> listPost = RxList<CompanyModel>([]);
  int currentPage = 0;
  int companiesPerPage = 5; // Define o número de empresas por página

  bool get hasMoreData =>
      listPost.length % companiesPerPage == 0; // Verifica se há mais dados para carregar

  @override
  void onInit() {
    super.onInit();

    getCompanies("");
  }

  Future post() async {
    isLoading.value = true;

    // print(user);
    String token = auth.user.token!;

    ApiResult<CompanyModel> result = await repository.insert(token: token, company: company);

    if (!result.isError) {
      company = result.data!;
      assessment.company = company;
      assessment.user = auth.user;
      assessment.note = assessmentController.sliderValue.value.toInt();

      ApiResult<AssessmentModel> resultAssessment =
          await assessmentRepository.insert(token: token, assessment: assessment);

      if (!resultAssessment.isError) {
        assessment = resultAssessment.data!;
        appUtils.showToast(message: "Company cadastrada com sucesso!");
      }

      Get.offAllNamed(AppRoutes.base);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future loadMoreCompanies() async {
    currentPage++;
    await getCompanies("");
  }

  Future getCompanies(String? filter) async {
    isLoading.value = true;

    String token = auth.user.token!;

    ApiResult<List<CompanyModel>> result =
        await repository.getAll(token: token, filter: filter, page: currentPage);
    if (!result.isError) {
      if (currentPage == 0) {
        listPost.assignAll(result.data!);
      } else {
        listPost.addAll(result.data!);
      }
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}
