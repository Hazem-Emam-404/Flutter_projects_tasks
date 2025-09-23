import 'package:api_training/features/users/data/user_controller.dart';
import 'package:api_training/features/users/ui/user_form_sheet.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'features/users/ui/users_screen.dart';

main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UsersScreen(), debugShowCheckedModeBanner: false);
  }
}


