import 'package:avalie/app/models/company_model.dart';
import 'package:flutter/material.dart';


class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    super.key,
    required this.model,
  });

  final CompanyModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("${model.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("${model.branch}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("${model.city}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
