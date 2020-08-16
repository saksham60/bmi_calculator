import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/roundiconbutton.dart';
import '../components/bottom_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
enum Gender {
  alert,
  male,
  female,
}
int height = 180;
int weight=60;
int age=16;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecard = colour1;
  Color femalecolor = colour1;
  Gender g=Gender.alert;
// void updateColor(Gender g){
//   if(g==Gender.male){
//     if(malecard==colour1){
//       malecard=colour;
//       femalecolor=colour1;
//     }
//     else malecard=colour1;
//   }
//   else
//     {
//       if(femalecolor==colour1){
//         femalecolor=colour;
//         malecard=colour1;
//       }
//       else femalecolor=colour1;
//     }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        tap: () {
                          setState(() {
                            g = Gender.male;
                          });
                        },
                        color: g == Gender.male ? colour : colour1,
                        childW: IconContent(
                          text: 'Male',
                          icon: FontAwesomeIcons.mars,
                        )),
                  ),
                  Expanded(
                      child: ReusableCard(
                    tap: () {
                      setState(() {
                        g = Gender.female;
                      });
                    },
                    color: g == Gender.female ? colour : colour1,
                    childW: IconContent(
                        text: 'Female', icon: FontAwesomeIcons.venus),
                  ))
                ],
              ),
              ReusableCard(
                color: (colour),
                childW: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(height.toString(), style: kValueTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1550),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: minheight,
                        max: maxheight,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    color: (colour),
                        childW: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Weight',style: kLabelTextStyle,),
                            Text(weight.toString(),style: kValueTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icn: FontAwesomeIcons.minus,pressed: (){setState(() {
                                  if(weight>1){weight--;}
                                });}, ),
                                SizedBox(width: 15,),
                                RoundIconButton(icn: FontAwesomeIcons.plus, pressed: (){setState(() {
                                  if(weight<443){weight++;}
                                });},),
                              ],
                            )
                          ],
                        ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: (colour),
                        childW: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Age',
                              style: kLabelTextStyle,
                            ),
                            Text(age.toString(),style: kValueTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icn: FontAwesomeIcons.minus,pressed:(){setState(() {
                                  if(age>1){age--;}
                                });} ,),
                                SizedBox(width: 15,),
                                RoundIconButton(icn:FontAwesomeIcons.plus,pressed:(){setState(() {
                                  if(age<125){age++;}
                                });} ,),
                              ],
                            )
                          ],
                        ),
                  ))
                ],
              ),
              BottomButton(tap:(){
                if(g==Gender.alert){
                  Alert(
                      context: context,
                      title: "Please select Gender",
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();

                }
                else {
                  Calculator c = Calculator(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(bmiResult: c.calBMI(),
                            info: c.getinfo(),
                            resultText: c.getResults(),)));
                }
                },name:'CALCULATE'),
            ],
          ),
        ));
  }
}



