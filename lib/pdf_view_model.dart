import 'package:flutter/material.dart';

import 'question_model.dart';

class PdfViewModel extends ChangeNotifier{
  List<QuestionModel> _addPdfQuesList=[];

  void addQuesList(QuestionModel quess){
    _addPdfQuesList.add(quess);

    notifyListeners();
  }




  List<QuestionModel> get addPdfQuesList=>_addPdfQuesList;
}