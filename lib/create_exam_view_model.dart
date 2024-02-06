import 'package:flutter/material.dart';
import 'package:pdfcreator/question_model.dart';

import 'acquisition_model.dart';
class CreateExamModel {
  String lesson;
  String grade;
  String secnario;
  String acquisition;
  List<QuestionModel> selectedQuessList;

  CreateExamModel({required this.lesson, required this.grade, required this.secnario,
  required this.acquisition, required this.selectedQuessList});
}
class CreateExamViewModel extends ChangeNotifier{
CreateExamModel? myExam;
List<AcquisitionModel>? acqListWithSelectSecnario;

Future<void> createAcqList (List<AcquisitionModel> list, int index ) async{
  ///listeyi ilk başta boşaltıyorum. Eğer içinde eleman varsa kazanım sayfasından
  ///geri gelmiştir ve yeni senaryo seçecektir. Eğer ilk kez senaryo seçecekse de
  ///boş liste verip senaryoda o kazanım var mı diye kontrol ettikten sonra
  ///senaryoya göre kazanım listesi oluşturuyorum.
  acqListWithSelectSecnario=[];
    for(var i in list){
      if(i.secnarioQuessStatus[index]!=0){
        acqListWithSelectSecnario?.add(i);
      }
    }

  notifyListeners();
}

addLesson(String lesson){
  myExam?.lesson=lesson;
  notifyListeners();
}
addGrade(String grade){
  myExam?.grade=grade;
  notifyListeners();
}
addSecnario(String secnario){
  myExam?.secnario=secnario;
  notifyListeners();
}
addAcquisition(String acquisition){
  myExam?.acquisition=acquisition;
  notifyListeners();
}
addQuess(QuestionModel quess){
  myExam?.selectedQuessList.add(quess);
  notifyListeners();
}

}

