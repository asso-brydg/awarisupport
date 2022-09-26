import 'package:awarisupport/backend/controllers/auth_controller.dart';
import 'package:awarisupport/backend/controllers/support_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import "package:flutter/material.dart";
import 'firebase_options.dart';
import 'frontend/welcome_screen.dart';

import 'frontend/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthController());
    Get.put(SupportController());
  });
  runApp(const MessengerApp());
}

class MessengerApp extends StatelessWidget {
  const MessengerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const WelcomeScreen(),
    );
  }
}
