import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/assessment_controller.dart';
import '../../core/config/app_colors.dart';
import '../../core/functions/assessment_function.dart';
import '../../core/widgets/slider_assessment_widget.dart';
import '../../models/company_model.dart';

class InfoCompanyPage extends StatelessWidget {
  InfoCompanyPage({Key? key, required this.companyModel}) : super(key: key);

  final CompanyModel companyModel;

  final _formKey = GlobalKey<FormState>();
  final nameTExtController = TextEditingController();
  final branchTExtController = TextEditingController();
  final cityTExtController = TextEditingController();
  final noteTExtController = TextEditingController();

  //final controllerCompany = Get.find<CompanyController>();
  final controller = Get.find<AssessmentController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Use as informações do CompanyModel aqui
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment this company'),
      ),
      backgroundColor: AppColors.background,
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Formulário
                Padding(
                  padding: const EdgeInsets.all(29.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Nome
                        Text(
                "${companyModel.name}",
                style:
                    const TextStyle(fontSize: 24, color: AppColors.primaryText),
              ),
              const SizedBox(height: 30),
              Container(
                width: 130, // Defina a largura desejada
                height: 80, // Defina a altura desejada
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Avaliação",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.primaryText),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            "${AssessmentFunction.average(companyModel.assessments!)}",
                            style: const TextStyle(
                                color: AppColors.secundary, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "/5",
                            style: TextStyle(
                                color: AppColors.secundaryText, fontSize: 14),
                          ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(height: 16), // Espaço entre os containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130, // Largura dos containers
                    height: 80, // Altura dos containers
                    margin: const EdgeInsets.only(
                        right: 8), // Espaço entre os containers
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundComponent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cidade",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.secundaryText),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "${companyModel.city}",
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.primaryText),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 130, // Largura dos containers
                    height: 80, // Altura dos containers
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundComponent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ramo",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.secundaryText),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "${companyModel.branch}",
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.primaryText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SliderAssessmentWidget(),


              // Botão de entrar
              SizedBox(
                height: 50,
                child: GetX<AssessmentController>(builder: (controller) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    onPressed: controller.isLoading.value == true
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();


                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();


                              controller.assessment.company = companyModel;
                              controller.post();
                            }
                          },
                    child: controller.isLoading.value == true
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : const Text(
                            'Avaliar',
                            style: TextStyle(fontSize: 16),
                          ),
                  );
                }),
              ),
            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
