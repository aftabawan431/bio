import 'dart:io';

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
    static Future<void> uploadAnswer(){

    }

}
