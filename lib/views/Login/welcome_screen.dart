import 'package:flutter/material.dart';
import 'package:iman/providers/welcome_provider.dart';
import 'package:provider/provider.dart';
import '../../core/models/user.dart';

class Welcome_Screen extends StatefulWidget {
  static String id = 'welcome_screen';

  const Welcome_Screen({super.key});
  @override
  _Welcome_ScreenState createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void checkbutton(String newValue) {
  //   if (emailController.text.length >= 3 &&
  //       passwordController.text.length >= 3) {
  //     setState(() {
  //       isButtonEnabled = true;
  //     });
  //   } else {
  //     setState(() {
  //       isButtonEnabled = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100.0,
                child: Image.asset('image/logo.png'),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Center(
                child: Text(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<User_Provider>(builder: (context, userProvider, _) {
                return TextField(
                  controller: emailController,
                  onChanged: (newValue) {
                    userProvider.checkbutton(newValue,emailController.text);
                  },
                  decoration: const InputDecoration(
                      hintText: 'service@vndigitech.com',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ))),
                );
              }),
              const SizedBox(
                height: 35,
              ),
              Consumer<User_Provider>(
                builder: (context, userProvider, child) {
                  return TextField(
                    controller: passwordController,
                    onChanged: (newValue) {
                      userProvider.checkbutton(newValue, passwordController.text);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: '******',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ))),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Material(
                child: Consumer<User_Provider>(
                  builder: (context, userProvider, child) {
                    return MaterialButton(
                      elevation: 4,
                      color: userProvider.isButtonEnabled
                          ? Color.fromRGBO(238, 99, 44, 1)
                          : Colors.grey,
                      minWidth: 400.0,
                      height: 40.0,
                      onPressed: () async {
                        final logins = User(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString());
                        userProvider.login(logins, context);
                  
                      },
                      child: const Text(
                        'Đăng Nhập',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: InkWell(
                onTap: () {},
                child: const Text('Quên Mật Khẩu ?',
                    style: TextStyle(color: Color.fromRGBO(2, 153, 155, 1))),
              ))
            ]),
      ),
    );
  }
}
