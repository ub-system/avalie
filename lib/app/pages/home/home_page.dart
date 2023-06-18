import 'package:avalie/app/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_controller.dart';
import '../../core/widgets/search_widget.dart';
import '../../core/widgets/company_widget.dart';
import '../../models/company_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final CompanyController controller = Get.find();

  void searchCompanies(String searchTerm) {
    controller.getCompanies(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: SearchWidget(
                    onSearch: searchCompanies,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
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
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.listPost.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < controller.listPost.length) {
                          CompanyModel model = controller.listPost[index];
                          return CompanyWidget(
                            model: model,
                            onLoadMore: () {
                              controller.loadMoreCompanies();
                            },
                          );
                        } else if (controller.hasMoreData) {
                          return ListTile(
                            title: const Center(
                              child: Text(
                                'Mostrar mais empresas',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            onTap: () {
                              controller.loadMoreCompanies();
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
