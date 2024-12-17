import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../dashboard/start_screen.dart';
import 'custom_text_field2.dart'; // Make sure to import your CustomTextField2

class ViewTwo extends StatelessWidget {
  final PageController pageController; // Accept PageController as a parameter
  final ImagePicker _imagePicker = ImagePicker();

  ViewTwo({
    super.key,
    required this.pageController,
  });

  Future<void> _pickImage(context) async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Upload item images",
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
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Select date",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: 'MM/YY/DD',
                showDatePicker: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Start time",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: 'Enter starting time',
                showDatePicker: false,
                showTimePicker: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "End time",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: 'Enter ending time',
                showDatePicker: false,
                showTimePicker: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pickup Instruction",

                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextField2(
                hintText: '',
                showDatePicker: false,

                maxLines: 2,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomElevatedButton(
                title: "Next",
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                borderRadius: 5,
                onPress: () {
                  // Use the PageController to switch to the third page (ViewThree)
                  pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
