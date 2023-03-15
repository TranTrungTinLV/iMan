import 'package:flutter/material.dart';

class Register_Screen extends StatefulWidget {
  static String id = "register_Screen";
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset('image/logo.png'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'IMAN',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, 4.0),
                              blurRadius: 3.0,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                            Shadow(
                              offset: Offset(4.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                    hintText: 'service@vndigitech.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ))),
              ),
              const SizedBox(
                height: 35,
              ),
              TextField(
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                    hintText: '******',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ))),
              ),
              const SizedBox(
                height: 50,
              ),
              Material(
                child: MaterialButton(
                  elevation: 4,
                  color: const Color.fromRGBO(238, 99, 44, 1),
                  minWidth: 400.0,
                  height: 40.0,
                  onPressed: () {},
                  child: const Text(
                    'Đăng Ký',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
            ]),
      ),
    );
  }
}
