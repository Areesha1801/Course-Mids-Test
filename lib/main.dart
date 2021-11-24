import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/resultpage.dart';
import 'calbrain.dart';
import 'components/bottom_button.dart';
import 'components/icon_content.dart';
import 'components/reusable_card.dart';
import 'constants.dart';

CalBrain obj = CalBrain();

class GPFPage extends StatefulWidget {
  const GPFPage({Key key}) : super(key: key);
  static double holder_2 = 1;
  static List<int> myList_2 = [];
  @override
  _GPFPageState createState() => _GPFPageState();
}

class _GPFPageState extends State<GPFPage> {
  var difference = 365;
  var selectedDate1 = DateTime.now();
  var selectedDate2 = DateTime.now();
  int height = 2500;
  double subjectGpa = 4;
  double subjectCreditHours = 4;
  double sumOfCredits = 0;
  double finalGpa = 0;
  double store = 0;
  double sStore = 0;
  int count = 1;
  int noOfSubjects = 0;
  _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('GPF Calculator'),
        actions: [
          IconButton(
            icon: Image.asset('images/img1.jpg'),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Row(
        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: Text(
                    'Areesha Asif',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("GPA"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const GPFPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Deduction Amount per Month',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'Rs',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 1000.0,
                      max: 2500.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Start Date',
                          style: kLabelTextStyle,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "${selectedDate1.toLocal()}".split(' ')[0],
                              style: kNumberTextStyle,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              onPressed: () =>
                                  _selectDate1(context), // Refer step 3
                              child: const Text('Select date',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  )),
                              color: Colors.black26,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'End Date',
                          style: kLabelTextStyle,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "${selectedDate2.toLocal()}".split(' ')[0],
                              style: kNumberTextStyle,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              onPressed: () =>
                                  _selectDate2(context), // Refer step 3
                              child: const Text('Select date',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  )),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              difference = selectedDate2.difference(selectedDate1).inDays;
              obj.calculate(difference, height);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => resultPage()));
            },
          ),
        ],
      ),
    );
  }
}
