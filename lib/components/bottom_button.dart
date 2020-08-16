import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({this.tap,this.name});
  final Function tap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Center(
          child: Text(name,
            style: klargeButtonText,),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        height: 80,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
