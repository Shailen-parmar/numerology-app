import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color deepNavyBlue = Color(0xFF20264F); // Define deepNavyBlue

    return MaterialApp(
      title: 'DigitZ',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primarySwatch: Colors.grey, // Use grey as the base, then customize
        scaffoldBackgroundColor: Colors.grey[100], // Soft beige background

        // Define the default font family.
        fontFamily: 'Roboto',

        // Customize the TextTheme to use Roboto and Montserrat
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: 'Roboto'),
          headlineSmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black87, fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat', color: Colors.black87),
          labelLarge: TextStyle(fontFamily: 'Roboto', color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: deepNavyBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: deepNavyBlue), // Line-style icons
      ),
      home: SplashScreen(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numerology App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Calculate Name'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NameCalculator()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Calculate Date of Birth'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DateOfBirthCalculator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NameCalculator extends StatefulWidget {
  @override
  _NameCalculatorState createState() => _NameCalculatorState();
}

class _NameCalculatorState extends State<NameCalculator> {
  String name = '';
  int totalSum = 0;
  int singleDigit = 0;

  Map<String, int> charValues = {
    'A': 1, 'I': 1, 'J': 1, 'Q': 1, 'Y': 1,
    'B': 2, 'K': 2, 'R': 2,
    'C': 3, 'G': 3, 'L': 3, 'S': 3,
    'D': 4, 'M': 4, 'T': 4,
    'E': 5, 'H': 5, 'N': 5, 'X': 5,
    'U': 6, 'V': 6, 'W': 6,
    'O': 7, 'Z': 7,
    'F': 8, 'P': 8,
  };

  void calculateName(String name) {
    totalSum = 0;
    name = name.toUpperCase();
    for (int i = 0; i < name.length; i++) {
      if (charValues.containsKey(name[i])) {
        totalSum += charValues[name[i]]!;
      }
    }

    singleDigit = totalSum;
    while (singleDigit > 9) {
      int temp = 0;
      String numStr = singleDigit.toString();
      for (int i = 0; i < numStr.length; i++) {
        temp += int.parse(numStr[i]);
      }
      singleDigit = temp;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                name = text;
              },
              onSubmitted: (text) {
                calculateName(text);
              },
            ),
            SizedBox(height: 20),
            Text('Total Sum: $totalSum', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Single-digit: $singleDigit', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class DateOfBirthCalculator extends StatefulWidget {
  @override
  _DateOfBirthCalculatorState createState() => _DateOfBirthCalculatorState();
}

class _DateOfBirthCalculatorState extends State<DateOfBirthCalculator> {
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  int mulank = 0;
  int bhagyank = 0;

  void calculateDateOfBirth(String day, String month, String year) {
    int tempMulank = 0;
    int tempBhagyank = 0;

    if (day.isNotEmpty) {
      for (int i = 0; i < day.length; i++) {
        tempMulank += int.parse(day[i]);
      }
      while (tempMulank > 9) {
        int temp = 0;
        String numStr = tempMulank.toString();
        for (int i = 0; i < numStr.length; i++) {
          temp += int.parse(numStr[i]);
        }
        tempMulank = temp;
      }
    }

    String dob = day + month + year;
    if (dob.isNotEmpty) {
      for (int i = 0; i < dob.length; i++) {
        tempBhagyank += int.parse(dob[i]);
      }

      while (tempBhagyank > 9) {
        int temp = 0;
        String numStr = tempBhagyank.toString();
        for (int i = 0; i < numStr.length; i++) {
          temp += int.parse(numStr[i]);
        }
        tempBhagyank = temp;
      }
    }

    setState(() {
      mulank = tempMulank;
      bhagyank = tempBhagyank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date of Birth Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: dayController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Day',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: monthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Month',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: () {
                calculateDateOfBirth(
                  dayController.text,
                  monthController.text,
                  yearController.text,
                );
              },
            ),
            SizedBox(height: 20),
            Text('Mulank: $mulank', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Bhagyank: $bhagyank', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
