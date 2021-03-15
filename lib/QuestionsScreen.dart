
import 'package:biography1/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Questions.dart';
import 'QuestionsHub.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:biography1/Widgets/customAlertDialoge.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  final String id;
  QuestionsScreen(this.id);
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  bool _loading=false;
   File _answerImg;
  final Color logoGreen = Color(0xff25bcbb);
  bool disabler = false;
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  TextEditingController controller = new TextEditingController();
  QuestionsHub questionsHub=QuestionsHub();
  void resetAll() {
    setState(() {
      disabler = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuestionsCollection questionsCollection=QuestionsCollection();
    var data= questionsCollection.getdataList(widget.id);
    QuestionsHub.questionsofHub=questionsCollection.getdataList(widget.id);

  }
  var _image;
  final picker = ImagePicker();

  Future getImage() async {
    var image = await  ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
      if (image != null) {
       _answerImg =File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _emailControllerField = TextEditingController();
          return CustomAlertDialog(
            content: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 4.0,
                color: Colors.white,
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/smile.png'),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                          'Questions Ended',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text('publish'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( logoGreen)),
                        onPressed: (){
                        Navigator.popAndPushNamed(context,'/b');
                        setState(() {
                          QuestionsHub().resetQuestionNo();
                        });
                      },

                    )
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:_loading?CircularProgressIndicator(): Scaffold(
            resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color(0xff25bcbb),
            title: Text('Questions Screen'),
          ),
      body: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if(_answerImg!=null)
              Expanded(child: Image.file(_answerImg,fit: BoxFit.cover,)),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                    ElevatedButton(onPressed:(){
                      // Navigator.popAndPushNamed(context,'/b');


                    },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( logoGreen)),

                        child:Row(
                          children: [
                            Text("Publish",style: TextStyle(color: Colors.white),),
                            Icon(Icons.publish,
                            color: Colors.white),
                          ],
                        ) ),
                  ],),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Qno:${QuestionsHub.getCurrentQuestion()}',style: TextStyle(fontSize: 20,color: Colors.white),),
                      Text(QuestionsHub.getQuestionsText(),style: TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),
                ],
              ),
            )
              ,
              Expanded(
              flex: 3,
                child: Column(
                  children: [
                    Container(

                      color: Color(0xFFf8f8ff).withOpacity(.0),
                    child: TextField(
                      controller: controller,
                      maxLines: 15,
                      cursorColor: logoGreen,
                      style: TextStyle(color: Colors.black ,fontSize: 20),

                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.0),

                            ),
                          ),
                          hintText: ('write your answer'),
                          hintStyle: TextStyle(color: Colors.black54),

                          // focusedBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          //     borderSide: BorderSide(color: Colors.white)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          labelStyle: TextStyle(color: Colors.white,fontSize: 15),
                          ),
                    ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed:getImage,
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( logoGreen),),

                      child:Row(
                        children: [
                          Icon(Icons.image),
                          Text(" Image"),
                        ],
                      ) ),
                  ElevatedButton(
                      onPressed: () {
                        if(_answerImg==null){
                          Answers.add( AnswerModel(
                              answer: controller.text,
                              ifImg: false,
                              img: null

                          ));

                        }else{
                        Answers.add( AnswerModel(
                              answer: controller.text,
                              ifImg: true,
                              img: _answerImg

                          ));
                        }
                        setState(() {
                          _answerImg=null;
                          controller.text="";
                        });

                        setState(() {
                     if (disabler == false) {
                           resetAll();
                          if(
                            // ignore: unrelated_type_equality_checks
                            QuestionsHub.getCurrentQuestion() == QuestionsHub.getTotalQuestion()-1)
                            {
                              showAlertDialog(context);
                            }else
                          QuestionsHub.nextQuestion();
                        }
                        });
                       },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( logoGreen)),

                      child:Row(
                        children: [
                          Text("Next ",style: TextStyle(color: Colors.yellow),),
                          Icon(Icons.navigate_next,
                          color: Colors.yellow,)
                        ],
                      ) ),

                ],
              ),
                  ],
                ),
              )],
          ),
        ),
      ),
    ));
  }
}
