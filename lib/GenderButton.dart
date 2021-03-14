import 'package:flutter/material.dart';

enum SingingCharacter { Male, Female }

/// This is the stateful widget that the main application instantiates.
class Gender extends StatefulWidget {


  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  SingingCharacter _character = SingingCharacter.Male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Male'),
          value: SingingCharacter.Male,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Female'),
          value: SingingCharacter.Female,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }}