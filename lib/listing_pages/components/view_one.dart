import 'package:flutter/material.dart';

import '../../dashboard/start_screen.dart';
import 'custom_text_field2.dart';

class ViewOne extends StatelessWidget {
  final PageController pageController; // Accept PageController as a parameter

  const ViewOne({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField2(
                  hintText: 'Enter item name',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Category",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField2(
                  hintText: 'Select item type',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField2(
                  hintText: 'Enter availability number',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Item description",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField2(
                  hintText: '',
                  maxLines: 8,
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomElevatedButton(
                  title: "Next",
                  titleTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  borderRadius: 5,
                  onPress: () {
                    // Use the PageController to switch to the second page (ViewTwo)
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}