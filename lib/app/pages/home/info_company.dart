import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/assessment_controller.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/slider_assessment_widget.dart';
import '../../core/widgets/text_field_widget.dart';
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
                        TextFieldWidget(
                          controller: nameTExtController,
                          icon: Icons.business,
                          label: 'Nome: ${companyModel.name}',
                        ),

                        // Ramo
                        TextFieldWidget(
                          controller: branchTExtController,
                          icon: Icons.business_center_outlined,
                          label: 'Ramo: ${companyModel.branch}',
                        ),

                        // Cidade
                        TextFieldWidget(
                            controller: cityTExtController,
                            icon: Icons.location_city,
                            label: 'Cidade: ${companyModel.city}'),

                        const SliderAssessmentWidget(),

                        // Botão de entrar
                        SizedBox(
                          height: 50,
                          child:
                              GetX<AssessmentController>(builder: (controller) {
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
