import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcreator/question_model.dart';

class Questions extends StatelessWidget {
   Questions({Key? key}) : super(key: key);
  List<QuestionModel> addPdfList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soru Seç'),
      ),
      body: Column(
        children: [

            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (context, int index){
              return ListTile(
                subtitle: Text(questions[index]),
                trailing: IconButton(onPressed: (){
                  addPdfList.add(questionList[index]);
                  print(addPdfList);
                }, icon: Icon(Icons.add_circle, color: Colors.green,)),
              );
            }),

          ElevatedButton(onPressed: ()async{
          await  createPDF(addPdfList);
          }, child: Text('PDF Oluştur'))
        ],
      ),
    );
  }
}


List<String> questions=["Okuduğunuz şiirin kahramanı kimdir? (10 Puan)",
"Sizce, ağaç kitaba dönüşmekten memnun mudur? Bunu şiirdeki hangi ifadelerden çıkarıyorsunuz? (10 Puan)",
"“Kitabın Serüveni” şiiri ile ilgili iki soru yazınız. (20 Puan,  10+10)"];

List<QuestionModel> questionList=[
  QuestionModel(question: "Kitabın Serüveni” şiiri ile ilgili iki soru yazınız. (20 Puan,  10+10)"),
  QuestionModel(premise: "Öncül Laaaaa", question: "Okuduğunuz şiirin kahramanı kimdir? (10 Puan)"),
  QuestionModel(imagePath: "assets/pic.JPG",question: "Sizce, ağaç kitaba dönüşmekten memnun mudur? Bunu şiirdeki hangi ifadelerden çıkarıyorsunuz? (10 Puan)",
  )
];

Future<pw.Font> loadFont() async {
  final fontData = await rootBundle.load('assets/times.ttf');
  return pw.Font.ttf(fontData.buffer.asByteData());
}
Future<Widget> imageLoad(imagePath)async{
  final ByteData image= await rootBundle.load('assets$imagePath');
  Uint8List imageData= (image).buffer.asUint8List();

  return pw.Image(
      pw.MemoryImage(imageData)
  ) as Widget?;
}



Future<void> createPDF(List<QuestionModel> questionsList) async {
  final pdf = pw.Document();
  pw.Font font = await loadFont();
  final ByteData image= await rootBundle.load('assets/pic.JPG');
  Uint8List imageData= (image).buffer.asUint8List();


  // Ekleme: Sayfa oluşturun
  pdf.addPage(
    pw.Page(
      // Ekleme: Sayfa içeriği oluşturun
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Ekleme: Her bir soru için bir metin ekleyin
            for (var question in questionsList)
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  ///öncül
                  (question.premise!=null) ? pw.Text(
                    question.premise!,
                  ):pw.SizedBox(),
                  ///resim
                  pw.SizedBox(
                      height: 150,
                      child:  imageLoad('pic.JPG')
                  ),
                  ///soru
                  pw.Text(
                    question.question,
                    style: pw.TextStyle(
                      font: font,
                    ),
                  ),
                  pw.SizedBox(
                    height: 50, // 250 piksel yükseklikte bir boşluk
                  ),

                ],
              ),



          ],
        );
      },
    ),
  );



  Directory? directory = Platform.isAndroid
      ? await getExternalStorageDirectory() //FOR ANDROID
      : await getApplicationSupportDirectory(); //FOR iOS

  //Get directory path
  final path = directory?.path;
  print(path);

  //Create an empty file to write PDF data
  final file = File('$path/Output.pdf');



  // Ekleme: Dosya oluşturun ve PDF içeriğini yazın
  //final file = File('example.pdf');
  await file.writeAsBytes(await pdf.save());

  // Oluşturulan PDF dosyasını doğrudan aç
  OpenFile.open('$path/Output.pdf');

}