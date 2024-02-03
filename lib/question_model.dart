import 'dart:io';

import 'package:flutter/services.dart';

class QuestionModel{
  final String question;
  final String? premise;
  final String? imagePath;

  QuestionModel({this.premise, required this.question, this.imagePath});

  Future<Uint8List> getImageData(String imagePath) async {
    File imageFile = File(imagePath);
    return await imageFile.readAsBytes();
  }
}