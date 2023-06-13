import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../../core/routes/app_routes_pages.dart';
import '../../core/services/validators.dart';
import '../../core/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailTExtController = TextEditingController();
  final passwordTExtController = TextEditingController();

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
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/img-login.png",
                      ),
                    ],
                  ),
                ),

                // Formulário
                Padding(
                  padding: const EdgeInsets.all(29.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        TextFieldWidget(
                          controller: emailTExtController,
                          icon: Icons.email,
                          label: 'Email',
                          validator: emailValidator,
                        ),

                        // Senha
                        TextFieldWidget(
                          controller: passwordTExtController,
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                          validator: passwordValidator,
                        ),

                        // Botão de entrar
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
                                        String email = emailTExtController.text;
                                        String password =
                                            passwordTExtController.text;
                                        controller.signIn(
                                            email: email, password: password);
                                      }
                                    },
                              child: controller.isLoading.value == true
                                  ? const CircularProgressIndicator(
                                      backgroundColor: Colors.white)
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(fontSize: 16),
                                    ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),

                // Botão criar conta
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.register);
                    },
                    child: const Text('Não possui conta? Crie uma agora!',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryText,
                          decoration: TextDecoration.underline,
                        )),
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
