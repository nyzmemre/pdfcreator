import 'package:flutter/material.dart';
import 'package:pdfcreator/acquisition_view.dart';
import 'package:provider/provider.dart';

import 'acquisition_data.dart';
import 'acquisition_model.dart';
import 'create_exam_view_model.dart';

class SecnarioView extends StatelessWidget {
   SecnarioView({Key? key, required this.grade}) : super(key: key);
   final int grade;

  @override
  Widget build(BuildContext context) {
    AcquisitionData acquisitionData=AcquisitionData();
    List<List<AcquisitionModel>> _modelList=[acquisitionData.besTurkceAcqList,acquisitionData.altiTurkceAcqList,acquisitionData.yediTurkceAcqList, acquisitionData.sekizTurkceAcqList ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Senaryo Seçiniz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(10, (index) => InkWell(
              onTap: (){
                Provider.of<CreateExamViewModel>(context, listen: false).addSecnario(index.toString());
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AcquisitionView(acqData: _modelList[grade], secnarioIndex: index,)));
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Card(
                child: Padding(padding: EdgeInsets.all(15),child: Text('${index+1}. Senaryo'),),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
