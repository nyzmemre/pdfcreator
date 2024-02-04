/*
import 'dart:typed_data';

import 'package:excel/excel.dart' as excel;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ReadDocument extends ChangeNotifier{
  String? acqName;

  Future<void> procressExcelFile(BuildContext context) async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xls', 'xlsx','pdf']
    );

    if (result != null) {
      if (result.files.first.extension == 'xlsx') {
        Uint8List bytes = result.files.first.bytes!;
        excel.Excel excelDoc = excel.Excel.decodeBytes(bytes);

        for (var table in excelDoc.tables.keys) {
          for (var row in excelDoc.tables[table]!.rows) {
            if (row[0] != null && row[0].toString().contains('KAZANIMLAR')) {
              acqName = row[0]
                  .toString()
                  .trim();
              */
/* .split('VALİLİĞİ')
                  .first
                  .toString()
                  .split('T.C.')
                  .last
                  .trim();*//*

            }
            if(row[0]!=null && row[0].toString().contains('other'))
          }
        }
      }
    }
  }
}*/
