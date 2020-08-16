import 'package:flutter/material.dart';
import 'screens/result_page.dart';
import 'screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context)=>InputPage(),
        '/first':(context)=>ResultPage(),
      },
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        accentColor: Colors.orange,
//        primaryColor: Color(0xFF0A0D22),
//        scaffoldBackgroundColor: Color(0xFF0A0D22),
//        textTheme: TextTheme(bodyText2:TextStyle(color: Colors.yellow), ),
//
//      ),
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      accentColor: Color(0xFFEB1555),
    ),
    );
  }
}

