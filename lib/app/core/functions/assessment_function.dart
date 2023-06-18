import 'package:avalie/app/models/assessment_model.dart';

class AssessmentFunction{
  static double average(List<AssessmentModel> assessments) {
  if (assessments.isEmpty) {
    return 0.0; // Retorna 0 se o array estiver vazio para evitar divisão por zero.
  }

  int sum = 0;
  for (AssessmentModel assessment in assessments) {
    sum += assessment.note!;
  }

  double average = sum / assessments.length;
  return double.parse(average.toStringAsFixed(1));;
}
}