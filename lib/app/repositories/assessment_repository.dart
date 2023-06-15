import 'package:avalie/app/core/services/http_manager.dart';
import 'package:avalie/app/core/utils/api_result.dart';
import 'package:avalie/app/core/utils/app_utils.dart';
import 'package:avalie/app/models/assessment_model.dart';

import '../core/utils/urls.dart';

class AssessmentRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  AssessmentRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<AssessmentModel>> insert(AssessmentModel assessment) async {
    const String endpoint = "${Url.base}/assessment";

    Map<String, dynamic> body = assessment.toMap();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: body,
    );

    if (response['data'] != null) {
      AssessmentModel assessment = AssessmentModel.fromMap(response['data']);

      return ApiResult<AssessmentModel>(data: assessment);
    } else {
      String message = response['error'] ?? "Não foi possível fazer o cadastro. Tente novamente!";
      return ApiResult<AssessmentModel>(message: message, isError: true);
    }
  }
}