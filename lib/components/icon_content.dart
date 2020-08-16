import 'package:flutter/material.dart';
import '../constants.dart';


class IconContent extends StatelessWidget {
  IconContent({@required this.text,@required this.icon});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: kLabelTextStyle,

        ),

      ],
    );
  }
}
