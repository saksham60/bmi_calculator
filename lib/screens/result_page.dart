import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/bottom_button.dart';
class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult,this.info,this.resultText});
  final String bmiResult;
  final String resultText;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextSyyle,

              ),
            ),
          ),
          Expanded(flex: 5,child: ReusableCard(color: colour,childW: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(resultText.toUpperCase(),
              style: kResultText,
              textAlign: TextAlign.center,),

              Text(bmiResult,style: kBMIText,textAlign: TextAlign.center,),
              Text(info,
              style: KBodyText,
              textAlign: TextAlign.center,),
            ],
          ),)),
          BottomButton(tap:(){Navigator.pop(context,);},name: 'Re-Calculate Your BMI',),

        ],
      ),
    );
  }
}
