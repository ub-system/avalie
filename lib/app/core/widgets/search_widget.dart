import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_controller.dart';
import '../config/app_colors.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key, required this.onSearch}) : super(key: key);

  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                        hintText: 'Buscar empresa',
                        hintStyle: TextStyle(
                          color: AppColors.secundaryText,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.secundaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      String searchTerm = searchController.text.trim();
                      if (searchTerm.isNotEmpty) {
                        onSearch(searchTerm);
                      }else{
                        onSearch("");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
