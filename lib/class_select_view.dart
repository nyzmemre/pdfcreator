import 'package:flutter/material.dart';
import 'package:pdfcreator/acquisition_data.dart';
import 'package:pdfcreator/acquisition_model.dart';
import 'package:pdfcreator/acquisition_view.dart';

class ClassSelect extends StatelessWidget {
  const ClassSelect({Key? key, required this.lessonName}) : super(key: key);
  final String lessonName;

  @override
  Widget build(BuildContext context) {
    AcquisitionData acquisitionData=AcquisitionData();
    List<String> _classSelect=['5','6','7','8'];
    List<List<AcquisitionModel>> _modelList=[acquisitionData.besTurkceAcqList,acquisitionData.altiTurkceAcqList,acquisitionData.yediTurkceAcqList, acquisitionData.sekizTurkceAcqList ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Sınıf Seçiniz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _classSelect.map((e) => InkWell(
              onTap: (){
                List<AcquisitionModel> selectedList=[];
                switch(e){
                  case '5':
                    selectedList=_modelList[0];
                  case '6':
                    selectedList=_modelList[1];
                    case '7':
                    selectedList=_modelList[2];
                    case '8':
                    selectedList=_modelList[3];
                }
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AcquisitionView(acqList: selectedList,)));
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
