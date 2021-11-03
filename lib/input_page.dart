import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'relatedObligations/constants.dart';
import 'page_of_result.dart';
import 'relatedObligations/calculator_brain.dart';

const double bottomContainerHeight = 80;
const int inactiveAppContainerColor = 0xFF111328;
const int appContainerColor = 0xFF1D1E33;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleColour = inactiveAppContainerColor;
  int femaleColour = inactiveAppContainerColor;
  int height = 120;
  int weight = 55;
  int age = 19;
  int test = 10;

  void updateColor(Gender gender) {
    setState(() {
      maleColour = (gender == Gender.male)
          ? appContainerColor
          : inactiveAppContainerColor;
      femaleColour = (gender == Gender.female)
          ? appContainerColor
          : inactiveAppContainerColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(Gender.male);
                    },
                    child: ReusableCard(
                      maleColour,
                      IconContent(FontAwesomeIcons.mars, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(Gender.female);
                    },
                    child: ReusableCard(
                      femaleColour,
                      IconContent(FontAwesomeIcons.venus, 'Female'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              appContainerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: styleOfText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: styleOfBoldText,
                      ),
                      Text(
                        'cm',
                        style: styleOfText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 40)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    appContainerColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: styleOfText,
                        ),
                        Text(
                          weight.toString(),
                          style: styleOfBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              Icons.remove,
                              () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              Icons.add,
                              () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    appContainerColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: styleOfText,
                        ),
                        Text(
                          age.toString(),
                          style: styleOfBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              Icons.remove,
                              () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              Icons.add,
                              () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(bottomContainerColor),
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: brain.calculateBMI(),
                      bmiMessage: brain.getAdvice(),
                      bmiStatus: brain.getResult(),
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onSelect);
  final IconData icon;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 45,
      ),
      onPressed: onSelect,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 70,
        height: 70,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
