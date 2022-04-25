import 'package:bmi_app/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.isMale,
    required this.result,
    required this.age,
  }) : super(key: key);

  final bool isMale;
  final double result;
  final int age;

  String get resultPhrase {
    String resultText;
if (result >= 30) resultText = 'Obees';
else if (result > 25 &&result < 30) resultText = 'Over Weight';
else if (result >= 18.5 && result <= 24.9) resultText = 'Normal';
else resultText = 'Thin';
    return resultText;
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Result', style: textstyle),
        backgroundColor: Kmaincolor,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 3.0,
                    color: Kmaincolor,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your Gender is: ${isMale? 'Male' : 'Female'}',
                    style: tstyle,
                  ),
                  Divider(
                    height: 3.0,
                  ),
                  Text(
                    'Your Age is: ${age}',
                    style: tstyle,
                  ),
                  Divider(
                    height: 3.0,
                  ),
                  Text(
                    ' Result : ${result.toStringAsFixed(2)}',
                    style: tstyle,
                  ),
                  Divider(
                    height: 3.0,
                  ),
                  Text(
                    'Healthiness: ${resultPhrase}',
                    style: tstyle,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}