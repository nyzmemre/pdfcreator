import 'package:flutter/material.dart';
import 'package:pdfcreator/create_exam_view_model.dart';
import 'package:pdfcreator/grade_select_view.dart';
import 'package:pdfcreator/secnario_view.dart';
import 'package:provider/provider.dart';

class LessonSelectView extends StatelessWidget {
  const LessonSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _lessonList=['Türkçe', 'Matematik', 'Fen ve Teknoloji', 'Sosyal Bilgiler','İngilizce', 'Din Kültürü ve Ahlak Bilgsi'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Ders Seçiniz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _lessonList.map((e) => InkWell(
              onTap: (){
                Provider.of<CreateExamViewModel>(context, listen: false).addLesson(e);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>GradeSelect(lessonName: e,)));

              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*.4,
                child: Card(
                  child: Padding(padding: EdgeInsets.all(15),child: Text(e, textAlign: TextAlign.center,),),
                ),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
