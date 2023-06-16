import 'package:avalie/app/core/services/http_manager.dart';
import 'package:avalie/app/core/utils/api_result.dart';
import 'package:avalie/app/core/utils/app_utils.dart';
import 'package:avalie/app/models/company_model.dart';

import '../core/utils/urls.dart';

class CompanyRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  CompanyRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<List<CompanyModel>>> getAll({required String token, String? filter}) async {
    const String endpoint = "${Url.base}/company";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'filter': filter,
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<CompanyModel> companyList = CompanyModel.fromList(list);

      return ApiResult<List<CompanyModel>>(data: companyList);
    } else {
      String message = response['error'] ?? "Não foi possível fazer login. Tente novamente!";
      return ApiResult<List<CompanyModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<CompanyModel>> insert({required String token, CompanyModel? company}) async {
    const String endpoint = "${Url.base}/company";

    Map<String, dynamic> body = company!.toMap();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: body,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      CompanyModel company = CompanyModel.fromMap(response['data']);

      return ApiResult<CompanyModel>(data: company);
    } else {
      String message = response['error'] ?? "Não foi possível fazer o cadastro. Tente novamente!";
      return ApiResult<CompanyModel>(message: message, isError: true);
    }
  }
}