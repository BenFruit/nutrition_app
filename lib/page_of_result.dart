import 'package:beatuful_bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'relatedObligations/constants.dart';
import 'reusable_card.dart';

Map messagesForBMI = {};

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.bmiStatus,
      required this.bmiMessage});
  final String bmiResult;
  final String bmiMessage;
  final String bmiStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULTS OF CALCULATION'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: styleOfTitleText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              titleAppContainerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiStatus,
                    style: TextStyle(color: Colors.green, fontSize: 30),
                  ),
                  Text(
                    bmiResult,
                    style: styleOfBmiResult,
                  ),
                  Text(
                    bmiMessage,
                    style: styleOfText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(bottomContainerColor),
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
