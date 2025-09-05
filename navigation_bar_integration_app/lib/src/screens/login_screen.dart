import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: 196,
        color: Color(0XFF4277FD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Login",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Enter a beautiful world",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(color: Color(0XFF9DB9E7), fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 100),
          TextFormField(

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Color(0XFF8B8D8F)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Color(0XFF8B8D8F)),
              ),
              hintText: "example@gmail.com",
              hintStyle: TextStyle(color: Color(0XFF6F7372).withOpacity(0.5)),
              label: Text(
                "Your Email",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0XFF6F7372),
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              filled: true,
              fillColor: Color(0XFFE6EDEB),
              prefixIcon: Icon(Icons.email, color: Color(0XFF4A4650)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter your Email';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Color(0XFF8B8D8F)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Color(0XFF8B8D8F)),
              ),
              label: Text(
                "Password",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0XFF6F7372),
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              filled: true,
              fillColor: Color(0XFFE6EDEB),
              prefixIcon: Icon(Icons.lock, color: Color(0XFF4A4650)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Color(0XFF4A4650),
                ),
              ),
            ),
            obscureText: !passwordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter your Password';
              }
              return null;
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "forget password",
                textAlign: TextAlign.end,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 9, color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            color: Color(0XFF4277FD),
            height: 60,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "LOGIN",
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 10, color: Color(0XFF767676)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Register Now",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
