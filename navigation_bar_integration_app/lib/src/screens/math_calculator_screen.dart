import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MathCalculatorScreen extends StatefulWidget {
  const MathCalculatorScreen({super.key});

  @override
  State<MathCalculatorScreen> createState() => _MathCalculatorScreenState();
}

class _MathCalculatorScreenState extends State<MathCalculatorScreen> {
  var num1Controller = TextEditingController();
  var num2Controller = TextEditingController();

  Future _openDialog(String content){
    return showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Something Wrong',style: TextStyle(color: Colors.white),),
      content: Text(content,style: TextStyle(color: Colors.white)),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OK")),
      ],
    ));
  }

  void _operation(String op) {
    if (num1Controller.text.isEmpty || num2Controller.text.isEmpty) {
      _openDialog("Please enter num1 and num2");
      return;
    }
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);
    if (num1 == null || num2 == null) {
      _openDialog("Please Enter a digit values");
      return;
    }
    if (op == '/' && num2 == 0) {
      _openDialog("We cannot divide by zero");
      return;
    }
    switch (op) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1- num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
    }
    setState(() {
    });
  }

  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFF007C6B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      TextFormField(
                        controller: num1Controller,
                        decoration: InputDecoration(
                          hint: Text(
                            "Num1",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: num2Controller,
                        decoration: InputDecoration(
                          hint: Text(
                            "Num2",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Color(0XFF044B40), width: 16, height: 10),
                  Text(
                    "Result = ${result.toStringAsFixed(1)}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(color: Color(0XFF044B40), width: 16, height: 10),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFF007C6B),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _operation('+');
                        },
                        backgroundColor: Color(0XFFEDDCFF),
                        child: Text(
                          "+",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _operation('-');
                        },
                        backgroundColor: Color(0XFFEDDCFF),
                        child: Text(
                          "-",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _operation('*');
                        },
                        backgroundColor: Color(0XFFEDDCFF),
                        child: Text(
                          "*",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _operation('/');
                        },
                        backgroundColor: Color(0XFFEDDCFF),
                        child: Text(
                          "/",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
