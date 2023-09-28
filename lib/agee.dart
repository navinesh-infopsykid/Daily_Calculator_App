import 'package:flutter/material.dart';

void main() {
  runApp(age());
}

class age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AgeCalculatorScreen(),
    );
  }
}

class AgeCalculatorScreen extends StatefulWidget {
  @override
  _AgeCalculatorScreenState createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  TextEditingController _birthdateController = TextEditingController();
  int _years = 0;
  int _months = 0;
  int _days = 0;

  @override
  void dispose() {
    _birthdateController.dispose();
    super.dispose();
  }

  void _calculateAge() {
    // Get the birthdate entered by the user
    String birthdateText = _birthdateController.text;

    // Check if the birthdate is empty
    if (birthdateText.isEmpty) {
      setState(() {
        _years = 0;
        _months = 0;
        _days = 0;
      });
      return;
    }

    // Parse the birthdate into a DateTime object
    DateTime birthdate;
    try {
      birthdate = DateTime.parse(birthdateText);
    } catch (e) {
      setState(() {
        _years = 0;
        _months = 0;
        _days = 0;
      });
      return;
    }

    // Calculate the age
    DateTime now = DateTime.now();
    int years = now.year - birthdate.year;
    int months = now.month - birthdate.month;
    int days = now.day - birthdate.day;

    if (days < 0) {
      months--;
      days += 30; // Assuming a month has 30 days for simplicity
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    setState(() {
      _years = years;
      _months = months;
      _days = days;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _birthdateController,
              decoration: InputDecoration(
                labelText: 'Enter your birthdate (yyyy-mm-dd)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateAge,
              child: Text('Calculate Age'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Age: $_years years, $_months months, $_days days',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
