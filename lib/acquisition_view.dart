import 'package:flutter/material.dart';
import 'package:pdfcreator/questions.dart';

import 'acquisition_model.dart';
class AcquisitionView extends StatelessWidget {
  const AcquisitionView({Key? key, required this.acqList, required this.secnarioIndex}) : super(key: key);
  final List<AcquisitionModel> acqList;
  final int secnarioIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Creator'),
        ),
        body: ListView.builder(
            itemCount: acqList.length,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Questions()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('Sorulacak Soru Sayısı: ${acqList[index].quesCount[secnarioIndex]}'),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(acqList[index].acqName),
                      ),
                    ),
                  ),
                ),
              );
            })
    );
  }
}


List<String> list=["T.5.3.5. Bağlamdan yararlanarak bilmediği kelime ve kelime gruplarının anlamını tahmin eder.",
  "T.5.3.6. Deyim ve atasözlerinin metne katkısını belirler.",
  "T.5.3.7. Kelimelerin eş anlamlılarını bulur.",
  "T.5.3.8. Kelimelerin zıt anlamlılarını bulur.",
  "T.5.3.9. Eş sesli kelimelerin anlamlarını ayırt eder.",
  "T.5.3.10. Kökleri ve ekleri ayırt eder.",
  "T.5.3.12. Metin türlerini ayırt eder.",
  "T.5.3.14. Metnin ana fikrini/ana duygusunu belirler.",
  "T.5.3.19. Metinle ilgili sorulara cevap verir.",
  "T.5.3.20. Metnin konusunu belirler.",
  "T.5.3.22. Görsellerle ilgili soruları cevaplar.",
  "T.5.3.24 Okuduğu metnin içeriğine yönelik başlık belirler.",
  "T.5.3.27. Metinler arasında karşılaştırma yapar.",
  "T.5.3.31. Okudukları ile ilgili çıkarımlarda bulunur.",
  "T.5.3.32. Metindeki söz sanatlarını tespit eder.",
  "T.5.3.33.Okuduğu metindeki gerçek, mecaz ve terim anlamlı sözcükleri ayırt eder.",
  "T.5.3.34. Grafik, tablo ve çizelgeyle sunulan bilgilere ilişkin soruları cevaplar.",];