
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class AnswerModel {
  final File img;
  final bool ifImg;
  final String answer;
  AnswerModel({this.img, this.answer, this.ifImg});
}

class Answers{
  static List<AnswerModel> answers = [];


     static void add(AnswerModel answer) {
      answers.add(answer);

    }
    static Future<void> uploadAnswer(String docId)async{
       for(var item in answers){
         print(item.img);
       var storage=FirebaseStorage.instance.ref('images/${DateTime.now().millisecondsSinceEpoch}');
       var imgUrl=null;
      if(item.ifImg==true){
      await storage.putFile(item.img);
      imgUrl=await storage.getDownloadURL();
      print(imgUrl);
      }
      var docRef=FirebaseFirestore.instance.collection('biographies').doc(docId);
      await docRef.update({
        "answers":FieldValue.arrayUnion([
          {
            "id":DateTime.now().millisecondsSinceEpoch,
            "answer":item.answer,
            "ifImg":item.ifImg,
            "imgUrl":imgUrl
          }
        ])
      });


       }

    }

}
