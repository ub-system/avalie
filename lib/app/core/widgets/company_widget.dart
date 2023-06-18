import 'package:avalie/app/core/config/app_colors.dart';
import 'package:avalie/app/models/company_model.dart';
import 'package:avalie/app/pages/home/info_company.dart';
import 'package:flutter/material.dart';

import '../functions/assessment_function.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    Key? key,
    required this.model,
    required this.onLoadMore,
  }) : super(key: key);

  final CompanyModel model;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoCompanyPage(companyModel: model),
          ),
        );
      },
      child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.backgroundComponent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: AppColors.secundary,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "${AssessmentFunction.average(model.assessments!)}",
                            style: const TextStyle(
                                color: AppColors.secundary, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${model.name}",
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.primaryText),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${model.city}",
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.secundaryText),
                      ),
                    ]),
              ))),
    );
  }
}
