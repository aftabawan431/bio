import 'dart:io';

import 'package:flutter/widgets.dart';

class AnswerModel {
  final String id;
  final File img;
  final bool ifImg;
  final String answer;
  AnswerModel({this.img, this.answer, this.ifImg, this.id});
}

class Answers  extends ChangeNotifier{
  final List<AnswerModel> _answers = [];


      void add(AnswerModel answers) {
      _answers.add(answers);

      notifyListeners();
    }

}
