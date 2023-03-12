import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iman/views/Home/homepage.dart';
import 'package:iman/views/Login/register.dart';
import 'package:iman/views/WelcomeSreen/welcome_screen.dart';

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
        HomePage.id: (context) => const HomePage(),
        Register_Screen.id: (context) => const Register_Screen(),
      },
    );
  }
}
