import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Icon_camera extends StatefulWidget {
  const Icon_camera({super.key});

  @override
  State<Icon_camera> createState() => _Icon_cameraState();
}

class _Icon_cameraState extends State<Icon_camera> {
  List<File> photos = [];
  final ImagePicker _picker = ImagePicker();
  File? _image;
  chooseFile() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> chooseCapture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        photos.add(_image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
              width: 95,
              height: 130,
              child: _image != null
                  ? Image.file(_image!)
                  : const Icon(
                      Icons.camera_alt,
                      size: 100,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    )),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            width: 200,
            height: 40,
            child: Material(
              borderRadius: BorderRadius.circular(5.0),
              elevation: 5.0,
              color: const Color.fromRGBO(2, 153, 155, 1),
              child: MaterialButton(
                minWidth: 200.0,
                height: 46.0,
                onPressed: () {
                  chooseCapture();
                },
                child: const Text(
                  'Chụp Ảnh',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 95,
                  height: 130,
                  child: SizedBox(
                    width: 95,
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: photos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          Image.file(
                            photos[index],
                          ),
                          Positioned(
                              child: Container(
                            padding: const EdgeInsets.only(
                                left: 50, right: 10, top: 10, bottom: 100),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    photos.removeAt(index);
                                  });
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.trash,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ))
                        ]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
