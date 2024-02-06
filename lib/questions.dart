import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcreator/pdf_view_model.dart';
import 'package:pdfcreator/product/utility/constants/text_constants.dart';
import 'package:pdfcreator/question_model.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  Questions({Key? key, required this.quesList}) : super(key: key);
  final List<QuestionModel> quesList;
  List<QuestionModel> addPdfList = [];
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.quesSelectTEXT),
      ),
      body: Consumer<PdfViewModel>(
        builder: (context, pdfViewModel, _) {
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: quesList.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      subtitle: Text(quesList[index].question),
                      trailing: IconButton(
                          onPressed: () {

                            pdfViewModel.addQuesList(quesList[index]);
                            curIndex = index;
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          )),
                    );
                  }),
              ElevatedButton(
                  onPressed: () async {
                    await createPDF(addPdfList, curIndex);
                  },
                  child: const Text(TextConstants.createPdfTEXT))
            ],
          );
        }
      ),
    );
  }
}

/*List<QuestionModel> questionList = [
  QuestionModel(
      question:
          "Kitabın Serüveni” şiiri ile ilgili iki soru yazınız. (20 Puan,  10+10)"),
  QuestionModel(imagePath: 'assets/firsat.png', question: "Takaşi takatako"),
  QuestionModel(
      premise: "Öncül Laaaaa",
      question: "Okuduğunuz şiirin kahramanı kimdir? (10 Puan)"),
  QuestionModel(
    imagePath: "assets/pic.JPG",
    question:
        "Sizce, ağaç kitaba dönüşmekten memnun mudur? Bunu şiirdeki hangi ifadelerden çıkarıyorsunuz? (10 Puan)",
  )
];*/

Future<pw.Font> loadFont() async {
  final fontData = await rootBundle.load('assets/times.ttf');
  return pw.Font.ttf(fontData.buffer.asByteData());
}

Future<pw.Widget> imageLoad(String imagePath) async {
  final ByteData image = await rootBundle.load(imagePath);
  final Uint8List imageData = image.buffer.asUint8List();
  return pw.Image(
    pw.MemoryImage(imageData),
  );
}

Future<void> createPDF(List<QuestionModel> addQuesList, int curIndex) async {
  final pdf = pw.Document();

  pw.Font font = await loadFont();
  var picData;
  var pic;
  ///mapi kullanma sebebim;
  ///addQuesListe yazılan verilerde imagePath var mı yok mu kontrol ediyorum.
  ///bu kontrolde eğer image varsa indexini almam lazım.
  ///çünkü indexi almazsam pdf ye aktarırken kullanamam.
  ///map e eklediğimde addQuesList'deki index ile imagePath'i Uint8List'e çevirip kullanabiliyorum.
  Map<int,Uint8List> picMap={};
  for(int i=0;i< addQuesList.length;i++) {
    if(addQuesList[i].imagePath!=null) {
      picData=await rootBundle.load(addQuesList[i].imagePath!);
      pic=picData.buffer.asUint8List();
      picMap.addAll({i: pic});
    }
  }


  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [

            for (int i=0; i<addQuesList.length;i++)
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  ///öncül
                  (addQuesList[i].premise != null)
                      ? pw.Text(
                    addQuesList[i].premise!,
                        )
                      : pw.SizedBox(),

                  ///resim
                  (pic != null && addQuesList[i].imagePath != null )
                      ? pw.Container(
                          height: 100, child: pw.Image(pw.MemoryImage(picMap[i]!)))
                      : pw.SizedBox(),

                  ///soru
                  pw.Text(
                    addQuesList[i].question,
                    style: pw.TextStyle(
                      font: font,
                    ),
                  ),
                  pw.SizedBox(
                    height: 50,
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


  final path = directory?.path;
  final file = File('$path/Output.pdf');
  await file.writeAsBytes(await pdf.save());
  OpenFile.open('$path/Output.pdf');
}
