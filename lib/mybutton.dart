import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String textButton;
  final GestureTapCallback pressButton;

  @override
  _MyButtonState createState() => _MyButtonState(this.textButton, pressButton:pressButton);
  MyButton(this.textButton, {@required this.pressButton});
}

class _MyButtonState extends State<MyButton> {
  String textButton;
  final GestureTapCallback pressButton;
  _MyButtonState(this.textButton, {@required this.pressButton});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: pressButton,
          label: Text(textButton),
          icon: Icon(Icons.search_outlined),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white
          ),
        )
      ],
    );
  }
}