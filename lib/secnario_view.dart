import 'package:flutter/material.dart';
import 'package:pdfcreator/acquisition_view.dart';

import 'acquisition_model.dart';

class SecnarioView extends StatelessWidget {
   SecnarioView({Key? key}) : super(key: key);
List<AcquisitionModel> acqList=[];
  @override
  Widget build(BuildContext context) {
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
                //Navigator.push(context, MaterialPageRoute(builder: (_)=>AcquisitionView()));
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
