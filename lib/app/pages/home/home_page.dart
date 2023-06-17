import 'package:avalie/app/controllers/company_controller.dart';
import 'package:avalie/app/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/company_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final CompanyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        // Envolve o conteúdo em um Column
        children: [
          RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              controller.getCompanies(null);
            },
            child: GetX<CompanyController>(
              init: controller,
              builder: (controller) {
                if (controller.isLoading.value == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    // Adiciona o Expanded para ocupar todo o espaço disponível
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.listPost.length,
                      itemBuilder: (BuildContext context, int index) {
                        CompanyModel model = controller.listPost[index];

                        return CompanyWidget(model: model);
                      },
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.secundaryText,
                        size: 24,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Buscar empresa',
                      hintStyle: TextStyle(
                        color: AppColors.secundaryText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
