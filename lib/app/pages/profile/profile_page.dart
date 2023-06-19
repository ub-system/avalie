import 'package:avalie/app/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await controller.signOut();
              }),
        ],
      ),
      body: GetX<ProfileController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Card(
              color: AppColors.backgroundComponent,
              margin: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Nome",
                      style: TextStyle(color: AppColors.secundaryText),
                    ),
                    Text("${controller.user.name}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText)),
                    const SizedBox(height: 16.0),
                    const Text(
                      "E-mail",
                      style: TextStyle(color: AppColors.secundaryText),
                    ),
                    Text("${controller.user.email}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText)),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
