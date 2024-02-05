import 'question_model.dart';

class AcquisitionModel{
  String acqName;
  List<int> secnarioQuessStatus;
  List<QuestionModel> questions;

  AcquisitionModel({required this.acqName, required this.secnarioQuessStatus, required this.questions});
}
