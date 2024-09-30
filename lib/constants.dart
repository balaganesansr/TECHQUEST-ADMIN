import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List teams = [];
int team_id = 0;
List urls = [];
List ro = [];
List rapidinfo = [];
List score_board = [];
var score_round = "R1_Performance";
String? img, image1, image2, image3, image4;
List rounds = ["MCQ ROUND", "PICTURE ROUND", "RAPID ROUND"];
List cur_ques = [];

Uint8List? url;
Uint8List? url1, url2, url4, url3;
bool img1 = false, img2 = false, img3 = false, img4 = false;
bool imgStatus = false;

width(context) => MediaQuery.of(context).size.width;
height(context) => MediaQuery.of(context).size.height;

Future<void> pickFile(String status) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png'],
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    Uint8List fileBytes = file.bytes!;
    if (status == "img") {
      url = fileBytes;
    } else if (status == "img1") {
      url1 = fileBytes;
    } else if (status == "img2") {
      url2 = fileBytes;
    } else if (status == "img3") {
      url3 = fileBytes;
    } else if (status == "img4") {
      url4 = fileBytes;
    }
  } else {}
}

Future<void> uploadImage(Uint8List fileBytes, String fileName) async {
  try {
    final Reference storageReference =
        FirebaseStorage.instance.ref().child(fileName);
    final UploadTask uploadTask = storageReference.putData(fileBytes);
    await uploadTask.whenComplete(() async {
      String downloadUrl = await storageReference.getDownloadURL();
      if (fileBytes == url1) {
        image1 = downloadUrl;
      } else if (fileBytes == url2) {
        image2 = downloadUrl;
      } else if (fileBytes == url3) {
        image3 = downloadUrl;
      } else if (fileBytes == url4) {
        image4 = downloadUrl;
      } else {
        img = downloadUrl;
      }
    });
  } catch (e) {
    print("Error uploading image: $e");
  }
}

var items2 = [
  'select-question',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20'
];

showAlertDialog(BuildContext context, String header, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(header),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ok'),
          ),
        ],
      );
    },
  );
}
