import 'package:flutter/material.dart';
import 'package:pdfcreator/product/utility/constants/text_constants.dart';
import 'package:pdfcreator/questions.dart';

import 'acquisition_model.dart';
class AcquisitionView extends StatelessWidget {
  const AcquisitionView({Key? key, required this.acqData, required this.secnarioIndex}) : super(key: key);
  final List<AcquisitionModel> acqData;
  final int secnarioIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(TextConstants.selectAcquisitionTEXT),
          actions: [
            IconButton(onPressed: (){

              print(acqData.length);
              print(acqData[0].acqName);
            }, icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: acqData.length,
            itemBuilder: (context, int index) {
                 return (acqData[index].secnarioQuessStatus[secnarioIndex]!=0) ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (acqData[index].secnarioQuessStatus[secnarioIndex]!=0) ? (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Questions(
                      quesList: acqData[index].questions,
                      selectQuesCount: acqData[index].secnarioQuessStatus[secnarioIndex],
                    )));
                  } : null,
                  child: Card(
                    color: (acqData[index].secnarioQuessStatus[secnarioIndex]!=0) ? Colors.redAccent[300] : Colors.grey[250],
                    child: ListTile(
                      title: Text('${TextConstants.askedQuessNumTEXT} ${acqData[index].secnarioQuessStatus[secnarioIndex]}'),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(acqData[index].acqName),
                      ),
                      trailing: const Column(
                        children: [
                          Icon(Icons.navigate_next_rounded),
                          Text(TextConstants.selectTEXT)
                        ],
                      ),
                    ),
                  ) ,
                ),
              ) : const SizedBox();
            })
    );
  }
}

