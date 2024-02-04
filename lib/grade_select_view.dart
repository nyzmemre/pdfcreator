import 'package:flutter/material.dart';
import 'package:pdfcreator/acquisition_data.dart';
import 'package:pdfcreator/acquisition_model.dart';
import 'package:pdfcreator/acquisition_view.dart';
import 'package:pdfcreator/secnario_view.dart';
import 'package:provider/provider.dart';

import 'create_exam_view_model.dart';

class GradeSelect extends StatelessWidget {
  const GradeSelect({Key? key, required this.lessonName}) : super(key: key);
  final String lessonName;

  @override
  Widget build(BuildContext context) {
    List<String> _gradeSelect=['5','6','7','8'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Sınıf Seçiniz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _gradeSelect.map((e) => InkWell(
              onTap: (){
                ///sınıf seviyesinin indexini seçerek sonraki sayfadaki sayfadaki kazanım listesini getiriyorum.
                int? selectedIndex;
                switch(e){
                  case '5':
                   selectedIndex=0;
                  case '6':
                   selectedIndex=1;
                  case '7':
                  selectedIndex=2;
                  case '8':
                   selectedIndex=3;
                }
                Provider.of<CreateExamViewModel>(context, listen: false).addGrade(e);
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SecnarioView(grade: selectedIndex ?? 0,)));
                //Navigator.push(context, MaterialPageRoute(builder: (_)=>AcquisitionView(acqList: selectedList,)));
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*.4,
                child: Card(
                  child: Padding(padding: EdgeInsets.all(15),child: Text('$e. Sınıf', textAlign: TextAlign.center,),),
                ),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
