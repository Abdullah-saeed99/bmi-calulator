import 'dart:math';

import 'package:bmi_app/core/constant.dart';
import 'package:bmi_app/core/utils/size_config.dart';
import 'package:bmi_app/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/widget/costum_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderVal = 170;
  bool isMale = false;
  int age = 18;
  double weight = 65;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Kmaincolor,
          title: Text('BMI Calculator',
              style: GoogleFonts.elMessiri(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomContanier(context, 'male'),
                        const SizedBox(width: 20),
                        CustomContanier(context, 'female'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.deepPurple[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Height', style: textstyle),
                            Text('${sliderVal.toStringAsFixed(1)} cm', style: textstyle),
                            Slider(
                              min: 0,
                              max: 200,
                              value: sliderVal,
                              onChanged: (val) {
                                setState(() {
                                  sliderVal = val;
                                });
                              },
                              activeColor: Kmaincolor,
                              inactiveColor: Colors.white,
                              label: '$sliderVal',
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomContainer2(context, 'weight'),
                        const SizedBox(width: 20),
                        CustomContainer2(context, 'age'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Kmaincolor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextButton(
                          onPressed: () {
                           var result = weight / pow(sliderVal /100 , 2);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Result(isMale: isMale, result: result, age: age,)));
                          },
                          child: Text(
                            'Get Your Result',
                            style: textstyle,
                          )),
                    ),
                    const SizedBox(height: 15),
                  ]),
            ),
          ),
        ));
  }

  Container CustomContainer2(BuildContext context, String type) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.deepPurple[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'weight' ? 'Weight' : 'age',
            style: textstyle,
          ),
          Text(
            type == 'weight' ? '$weight' : '$age',
            style: textstyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'weight' ? 'weight--' : 'age--',
                onPressed: () {
                  setState(() {
                    type == 'weight' ? weight-- : age--;
                  });
                },
                backgroundColor: Kmaincolor,
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                heroTag: type == 'weight' ? 'weight++' : 'age++',
                onPressed: () {
                  setState(() {
                    type == 'weight' ? weight++ : age++;
                  });
                },
                backgroundColor: Kmaincolor,
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector CustomContanier(BuildContext context, String type) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          isMale = (type == 'male') ? true : false;
        });
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 180,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: (isMale && type == 'male') || (!isMale && type == 'female')
              ? Kmaincolor
              : Colors.deepPurple[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              type == 'male' ? Icons.male : Icons.female,
              size: 100,
              color: Colors.white,
            ),
            Text(
              type == 'male' ? 'Male' : 'Female',
              style: textstyle,
            )
          ],
        ),
      ),
    );
  }
}
