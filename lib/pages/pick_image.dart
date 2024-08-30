import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isafetyscan/provider/image.dart';
import 'package:provider/provider.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    Future<void> _pickImageFromGallery() async {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage != null) {
        context.read<ImgProvider>().insert(returnedImage.path);
      }
    }

    Future<void> _pickImageFromCamera() async {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage != null) {
        context.read<ImgProvider>().insert(returnedImage.path);
      }
    }

    Future<void> uploadFile(String url, File file) async {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        // Upload successful
      } else {
        // Handle error
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "I Safety Scan",
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        actions: const [],
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  context.watch<ImgProvider>().pickedImage == ""
                      ? Container(
                          height: 350,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey[900]!,
                            ),
                          ),
                          child: const Center(
                            child: Text("Image 1"),
                          ),
                        )
                      : Container(
                          height: 350,
                          width: 200,
                          decoration: BoxDecoration(
                            // color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey[900]!,
                            ),
                          ),
                          child: Image.file(
                              File(context.watch<ImgProvider>().pickedImage)),
                        ),
                  Container(
                    height: 350,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Image 2"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Text("Pick Image"),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  // initialValue: '',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Masukan Nama",
                  ),
                  controller: _nameController,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                ),
                onPressed: _pickImageFromGallery,
                child: const SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Pick Image"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                ),
                onPressed: _pickImageFromCamera,
                child: const SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Take Photo"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Container(
                  width: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Submit"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
