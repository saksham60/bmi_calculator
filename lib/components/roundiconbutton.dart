import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icn,this.pressed});
  final IconData icn;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icn),
      onPressed: pressed,
      elevation: 6,
      shape:CircleBorder() ,
      fillColor: Color(0xFF222747),

      constraints:  BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,

      ),

    );
  }
}
