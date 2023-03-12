import 'package:flutter/material.dart';

class Save_camera extends StatelessWidget {
  const Save_camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 40,
        child: Material(
          borderRadius: BorderRadius.circular(5.0),
          elevation: 5.0,
          color: const Color.fromRGBO(238, 99, 44, 1),
          child: MaterialButton(
            minWidth: 300.0,
            height: 46.0,
            onPressed: () {},
            child: const Text(
              'Lưu',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
