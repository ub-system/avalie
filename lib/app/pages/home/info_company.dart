import 'package:flutter/material.dart';

import '../../models/company_model.dart';

class InfoCompanyPage extends StatelessWidget {
  const InfoCompanyPage({Key? key, required this.companyModel}) : super(key: key);

   final CompanyModel companyModel;

 @override
  Widget build(BuildContext context) {
    // Use as informações do CompanyModel aqui
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment this company'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${companyModel.name}'),
            Text('Filial: ${companyModel.branch}'),
            Text('Cidade: ${companyModel.city}'),
          ],
        ),
      ),
    );
  }
}