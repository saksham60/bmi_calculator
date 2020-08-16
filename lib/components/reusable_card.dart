import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color,this.childW,this.tap});
  final Color color;
  final Widget childW;
  final Function tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child:childW,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(15),
        height: 200,

      ),
    );
  }
}