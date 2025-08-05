import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Manrope",
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Color(0xFF121417),
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF121417),
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF61758A),
          ),

          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF121417),
          ),
        ),
      ),
      home: HomeScreen(), // Use a separate widget
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.titleLarge),
        leading: Icon(Icons.arrow_back, size: 24),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(14),
            width: double.infinity,
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    "../assets/images/prof_image.png",
                    width: 128,
                    height: 128,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Sophia Carter",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Product Designer",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Text(
              "Contact",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              spacing: 16,
              children: [
                Container(
                  width: 40,
                  height: 40,

                  decoration: BoxDecoration(
                    color: Color(0xFFF0F2F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.mail_outline),
                  alignment: Alignment.center,
                ),
                Text("sophia.carter@email.com",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Color(0xFF121417)),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              spacing: 16,
              children: [
                Container(
                  width: 40,
                  height: 40,

                  decoration: BoxDecoration(
                    color: Color(0xFFF0F2F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.phone_outlined),
                  alignment: Alignment.center,
                ),
                Text("+1 (555) 123-4567",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Color(0xFF121417)),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
