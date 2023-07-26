import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? imagefile;
  void getimage({required ImageSource}) async {
    final file = await ImagePicker().pickImage(source: ImageSource);
    if (file?.path != null) {
      setState(() {
        imagefile = File(file!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          elevation: 8,
          title: const Text(
            'capture image',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imagefile != null)
                Container(
                  width: 640,
                  height: 480,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    image: DecorationImage(
                      image: FileImage(imagefile!),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(width: 6, color: Colors.purple),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )
              else
                Container(
                  width: 640,
                  height: 480,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    border: Border.all(width: 6, color: Colors.purple),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    'Pick Image',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.purple[300]),
                        onPressed: () =>
                            getimage(ImageSource: ImageSource.camera),
                        child: const Text(
                          'Camera',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.purple[300]),
                        onPressed: () =>
                            getimage(ImageSource: ImageSource.gallery),
                        child: const Text(
                          ' gallery',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
