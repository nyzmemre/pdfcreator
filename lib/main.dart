import 'package:flutter/material.dart';
import 'package:pdfcreator/create_exam_view_model.dart';
import 'package:pdfcreator/read_document.dart';
import 'package:pdfcreator/secnario_view.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'lesson_select_view.dart';
import 'ziimbirti_viewmodel.dart';

void main() {

  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider<ReadDocument>(create: (_) => ReadDocument()),
    ChangeNotifierProvider<ZimbirtiViewModel>(create: (_) => ZimbirtiViewModel()),
    ChangeNotifierProvider<CreateExamViewModel>(create: (_) => CreateExamViewModel()),

  ], child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LessonSelectView(),
    );
  }
}

