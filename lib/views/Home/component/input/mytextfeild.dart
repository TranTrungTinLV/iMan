import 'package:flutter/material.dart';

class MyTextFeild extends StatefulWidget {
  const MyTextFeild({super.key});

  @override
  State<MyTextFeild> createState() => _MyTextFeildState();
}

class _MyTextFeildState extends State<MyTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        minLines: 2,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
            hintText: 'Mô tả',
            hintStyle: TextStyle(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    );
  }
}
