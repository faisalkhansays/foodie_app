import 'package:flutter/material.dart';

import '../home_screen/components/reusable_row.dart';
import 'components/custom_container.dart';
import 'components/view_one.dart';
import 'components/view_three.dart';
import 'components/view_two.dart';

class CreateListing extends StatefulWidget {
  const CreateListing({super.key});

  @override
  State<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const ReusableRow(
                title: "Create a listing",
                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                icon: Icons.arrow_back_ios_new_rounded,
                iconSize: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                    child: CustomContainer(isActive: currentPage == 0),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                    child: CustomContainer(isActive: currentPage == 1),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                    child: CustomContainer(isActive: currentPage == 2),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: [
                    ViewOne(pageController: _pageController),
                    ViewTwo(pageController: _pageController),
                    ViewThree(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
