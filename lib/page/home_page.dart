import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [GenderSelection(), SizedBox(height: 20), InputSection()],
      ),
    );
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

String? _gender = "";

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.3,
          child: RadioListTile(
            title: const Text('Male'),
            value: 'male',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value as String;
              });
            },
            activeColor: Colors.blue,
            dense: true,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
        (_gender == 'male')
            ? Image.asset('images/male.png', width: 100)
            : (_gender == 'female')
            ? Image.asset('images/female.png', width: 100)
            : Image.asset('images/loading.png', width: 100),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.3,
          child: RadioListTile(
            title: const Text('Female'),
            value: 'female',
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value as String;
              });
            },
            activeColor: Colors.blue,
            dense: true,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}

class InputSection extends StatefulWidget {
  InputSection({Key? key}) : super(key: key);

  @override
  _InputSectionState createState() => _InputSectionState();
}

double _height = 0;
double _weight = 0;
double _bmi = 0;

class _InputSectionState extends State<InputSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Height (cm)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _height = double.parse(value);
                      _bmi = bmiCalculator();
                    });
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight (kg)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _weight = double.parse(value);
                      _bmi = bmiCalculator();
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('BMI: $_bmi'),
        ],
      ),
    );
  }
}

double bmiCalculator() {
  if (_height == 0 || _weight == 0) {
    return 0;
  }
  double heightInMeter = convertHeightToMeter();
  double bmi = _weight / (heightInMeter * heightInMeter);
  return double.parse(bmi.toStringAsFixed(1));
}

double convertHeightToMeter() {
  return _height / 100;
}

