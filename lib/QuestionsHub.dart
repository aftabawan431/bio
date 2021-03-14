import 'Questions.dart';
class QuestionsHub{
static int questionNo =1;
static List<Question> questionsofHub=[

];
 static int getCurrentQuestion(){
  return questionNo;
}
static int getTotalQuestion(){
 return questionsofHub.length;
}
 static String getQuestionsText(){
  return  questionsofHub[questionNo].question;
}
static nextQuestion(){
 questionNo++;
}
bool questionsEnded(){
 if(questionNo==questionsofHub.length-1){
  return true;
 }else{
  return false;
 }
}
void resetQuestionNo(){
  questionNo=1;
}
}
