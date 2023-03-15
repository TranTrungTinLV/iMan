import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iman/views/Home/homepage.dart';
import 'package:iman/views/Register/register.dart';
import 'package:iman/views/Login/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome_Screen.id,
      routes: {
        Welcome_Screen.id: (context) => Welcome_Screen(),
        HomePage.id: (context) => HomePage(),
        Register_Screen.id: (context) => Register_Screen(),
      },
    );
  }
}
