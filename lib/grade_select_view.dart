import 'package:flutter/material.dart';
import 'package:pdfcreator/acquisition_data.dart';
import 'package:pdfcreator/acquisition_model.dart';
import 'package:pdfcreator/acquisition_view.dart';
import 'package:pdfcreator/product/utility/constants/list_constants.dart';
import 'package:pdfcreator/product/utility/constants/text_constants.dart';
import 'package:pdfcreator/secnario_view.dart';
import 'package:provider/provider.dart';

import 'create_exam_view_model.dart';

class GradeSelect extends StatelessWidget {
  const GradeSelect({Key? key, required this.lessonName}) : super(key: key);
  final String lessonName;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.selectGradeTEXT),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ListConstants.gradeListCONST.map((e) => InkWell(
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
                  child: Padding(padding: const EdgeInsets.all(15),child: Text('$e${TextConstants.dotGradeTEXT}', textAlign: TextAlign.center,),),
                ),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
