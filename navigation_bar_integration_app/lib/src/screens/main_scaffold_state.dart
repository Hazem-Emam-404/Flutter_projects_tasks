import 'package:bmi_calculator/src/screens/bmi_screen.dart';
import 'package:bmi_calculator/src/screens/login_screen.dart';
import 'package:bmi_calculator/src/screens/math_calculator_screen.dart';
import 'package:flutter/material.dart';

class MainScaffoldState extends StatefulWidget {
  const MainScaffoldState({super.key});

  @override
  State<MainScaffoldState> createState() => _MainScaffoldStateState();
}

class _MainScaffoldStateState extends State<MainScaffoldState> {
  int _currentIndex = 0;

  final _screens = [BmiScreen(), MathCalculatorScreen(), LoginScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: "BMI",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculator",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
        ],
        onTap: (value){setState(() {
          _currentIndex = value;
        });},
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0XFF413F41),
        selectedItemColor: Color(0XFF674FA3),
      ),
    );
  }
}
