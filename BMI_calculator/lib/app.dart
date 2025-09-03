import 'package:bmi_calculator/src/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.interTextTheme( // replace with any font
            Theme.of(context).textTheme,
          ),

        primaryColor: Color(0xFF24263B),
        scaffoldBackgroundColor: Color(0xFF1c2135),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF24263B))
      ),
      home: HomePage(),
    );
  }
}
