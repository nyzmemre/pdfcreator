import 'package:flutter/material.dart';
import 'package:pdfcreator/question_model.dart';
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

