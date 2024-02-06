import 'package:flutter/material.dart';
import 'package:pdfcreator/create_exam_view_model.dart';
import 'package:pdfcreator/pdf_view_model.dart';
import 'package:provider/provider.dart';

import 'lesson_select_view.dart';

void main() {

  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider<ReadDocument>(create: (_) => ReadDocument()),
    ChangeNotifierProvider<CreateExamViewModel>(create: (_) => CreateExamViewModel()),
    ChangeNotifierProvider<PdfViewModel>(create: (_) => PdfViewModel()),

  ], child: PdfCreator(),));
}

class PdfCreator extends StatelessWidget {
  const PdfCreator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDF Creator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LessonSelectView(),
    );
  }
}

