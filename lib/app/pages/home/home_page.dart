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
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          SearchWidget(
            onSearch: searchCompanies,
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
          ),
        ],
      ),
    );
  }
}
