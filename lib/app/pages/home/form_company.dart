import 'package:avalie/app/controllers/company_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/assessment_controller.dart';
import '../../core/config/app_colors.dart';
import '../../core/services/validators.dart';
import '../../core/widgets/text_field_widget.dart';

class FormCompanyPage extends StatelessWidget {
  FormCompanyPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameTExtController = TextEditingController();
  final branchTExtController = TextEditingController();
  final cityTExtController = TextEditingController();
  final noteTExtController = TextEditingController();

  final controllerCompany = Get.find<CompanyController>();
  final controllerAssessment = Get.find<AssessmentController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
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
                          label: 'Name',
                          validator: nameValidator,
                          onSaved: (value) {
                            controllerCompany.company.name = value;
                          },
                        ),

                        // Ramo
                        TextFieldWidget(
                          controller: branchTExtController,
                          icon: Icons.business_center_outlined,
                          label: 'Branch',
                          validator: nameValidator,
                          onSaved: (value) {
                            controllerCompany.company.branch = value;
                          },
                        ),

                        // Cidade
                        TextFieldWidget(
                          controller: cityTExtController,
                          icon: Icons.location_city,
                          label: 'City',
                          validator: namePlaceValidator,
                          onSaved: (value) {
                            controllerCompany.company.city = value;
                          },
                        ),

                        // Nota
                        TextFieldWidget(
                          controller: noteTExtController,
                          icon: Icons.assessment,
                          label: 'Note',
                          textInputType: TextInputType.number,
                          onSaved: (value) {
                            controllerCompany.assessment.note = int.tryParse(value!);
                          },
                        ),

                        // Botão de entrar
                        SizedBox(
                          height: 50,
                          child: GetX<CompanyController>(builder: (controller) {
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

                                        controller.post();
                                      }
                                    },
                              child: controller.isLoading.value == true
                                  ? const CircularProgressIndicator(
                                      backgroundColor: Colors.white)
                                  : const Text(
                                      'Cadastrar',
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