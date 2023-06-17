import 'package:avalie/app/controllers/company_controller.dart';
import 'package:avalie/app/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/company_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final CompanyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getCompanies();
        },
        child: GetX<CompanyController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.listPost.length,
                itemBuilder: (BuildContext context, int index) {
                  CompanyModel model = controller.listPost[index];

                  return CompanyWidget(model: model);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
