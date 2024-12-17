import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../dashboard/start_screen.dart';
import 'custom_text_field2.dart';

class ViewThree extends StatelessWidget {
  final ImagePicker _imagePicker = ImagePicker();

  ViewThree({
    super.key,
  });

  Future<void> _pickImage(context) async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      log('Image path:${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Organization name",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: 'Enter your trust name',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Address/location",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: 'Enter your address',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add location images",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 140,
                decoration: BoxDecoration(
                    color: const Color(0xffF5F7F9),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: GestureDetector(
                  onTap: () => _pickImage(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Image.asset("assets/uploadImageIcon.png")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add your images here",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              CustomElevatedButton(
                title: "Publish",
                titleTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                borderRadius: 5,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Publish(),
                      ));
                },
              ),
            ]),
          )),
    );
  }
}