import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iman/providers/welcome_provider.dart';
import 'package:iman/views/Home/homepage.dart';
import 'package:iman/views/Register/register.dart';
import 'package:iman/views/Login/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
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
    return ChangeNotifierProvider(
      create: (context) => User_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Welcome_Screen.id,
        routes: {
          Welcome_Screen.id: (context) => const Welcome_Screen(),
          HomePage.id: (context) => const HomePage(),
          Register_Screen.id: (context) => const Register_Screen(),
        },
      ),
    );
  }
}
