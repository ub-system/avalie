import 'package:avalie/app/models/company_model.dart';
import 'package:avalie/app/pages/home/info_company.dart';
import 'package:flutter/material.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CompanyModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegue para a próxima página aqui
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoCompanyPage(companyModel: model),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${model.name}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${model.branch}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${model.city}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}