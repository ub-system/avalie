import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../../core/services/validators.dart';
import '../../core/widgets/text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameTExtController = TextEditingController();
  final emailTExtController = TextEditingController();
  final passwordTExtController = TextEditingController();
  final passwordConfirmedController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        TextFieldWidget(
                          controller: nameTExtController,
                          icon: Icons.person,
                          label: 'Nome',
                          validator: nameValidator,
                          onSaved: (value) {
                            controller.user.name = value;
                          },
                        ),

                        // Email
                        TextFieldWidget(
                          controller: emailTExtController,
                          icon: Icons.email,
                          label: 'Email',
                          validator: emailValidator,
                          onSaved: (value) {
                            controller.user.email = value;
                          },
                        ),

                        // Senha
                        TextFieldWidget(
                          controller: passwordTExtController,
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                          validator: passwordValidator,
                          onSaved: (value) {
                            controller.user.password = value;
                          },
                        ),

                        // Senha
                        TextFieldWidget(
                          controller: passwordConfirmedController,
                          icon: Icons.lock,
                          label: 'Confirmar senha',
                          isSecret: true,
                          validator: passwordValidator,
                        ),

                        // Botão de criar conta
                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(builder: (controller) {
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

                                        String password =
                                            passwordTExtController.text;
                                        String passwordConfirmed =
                                            passwordConfirmedController.text;
                                        if (password == passwordConfirmed) {
                                          controller.signUp();
                                        } else {
                                          controller.appUtils.showToast(
                                              message:
                                                  "Senha de confirmação está diferente",
                                              isError: true);
                                        }
                                      }
                                    },
                              child: controller.isLoading.value == true
                                  ? const CircularProgressIndicator(
                                      backgroundColor: AppColors.primaryText)
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

                // Botão para realizar login
                /* SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: controller.isLoading.value == true
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : const Text('Já possui conta? Faça login aqui!',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              decoration: TextDecoration.underline,
                            )),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
