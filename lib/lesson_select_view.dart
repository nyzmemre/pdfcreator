import 'package:flutter/material.dart';
import 'package:pdfcreator/create_exam_view_model.dart';
import 'package:pdfcreator/grade_select_view.dart';
import 'package:pdfcreator/product/utility/constants/list_constants.dart';
import 'package:pdfcreator/product/utility/constants/text_constants.dart';
import 'package:pdfcreator/secnario_view.dart';
import 'package:provider/provider.dart';

class LessonSelectView extends StatelessWidget {
  const LessonSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.selectLessonTEXT),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ListConstants.lessonListCONST.map((e) => InkWell(
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
