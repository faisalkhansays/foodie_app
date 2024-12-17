import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../home_screen/components/custom_text_field.dart';
import '../home_screen/components/reusable_row.dart';
import '../listingpages/components/custom_container.dart';
import '../dashboard/start_screen.dart';

import 'create_password.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {
      currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const ReusableRow(
                title: "Profile creation",
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                icon: Icons.arrow_back_ios_new_rounded,
                iconSize: 18,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _navigateToPage(0),
                    child:
                        CustomContainer(isActive: currentPage == 0, width: 90),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => _navigateToPage(1),
                    child:
                        CustomContainer(isActive: currentPage == 1, width: 90),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => _navigateToPage(2),
                    child:
                        CustomContainer(isActive: currentPage == 2, width: 90),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => _navigateToPage(3),
                    child:
                        CustomContainer(isActive: currentPage == 3, width: 90),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: const [
                    PageOne(),
                    PageTwo(),
                    PageThree(),
                    PageFour(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String? _selectedOrganizationType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Organization name",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          const CustomTextField(
            hintText: 'Enter your organization/trust name',
            borderRadius: 5,
          ),
          const SizedBox(height: 20),
          Text(
            "Type of Organization",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          RadioListTile<String>(
            title: Text(
              "Non-profit",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Non-profit",
            groupValue: _selectedOrganizationType,
            onChanged: (value) {
              setState(() {
                _selectedOrganizationType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          RadioListTile(
            title: Text(
              "Religious institution",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Religious institution",
            groupValue: _selectedOrganizationType,
            onChanged: (value) {
              setState(() {
                _selectedOrganizationType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          RadioListTile<String>(
            title: Text(
              "Community group",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Community group",
            groupValue: _selectedOrganizationType,
            onChanged: (value) {
              setState(() {
                _selectedOrganizationType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          const SizedBox(height: 70),
          CustomElevatedButton(
            title: "Continue",
            onPress: () {
              // Navigate to the next page
              (context
                  .findAncestorStateOfType<_ProfileCreationScreenState>()
                  ?._navigateToPage(1));
            },
          )
        ],
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact number",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                width: 70,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: CountryCodePicker(
                    onChanged: (countryCode) {
                      log('Country code selected: ${countryCode.dialCode}');
                    },
                    initialSelection: 'US',
                    favorite: const ['+1', 'US'],
                    showFlag: false,
                    showCountryOnly: false,
                    enabled: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Color(0xffF5F7F9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff2BB673)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Contact email address",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const CustomTextField(
            hintText: "Enter your organization email address",
            borderRadius: 5,
          ),
          const SizedBox(height: 200),
          CustomElevatedButton(
            title: "Continue",
            onPress: () {
              // Navigate to the next page
              (context
                  .findAncestorStateOfType<_ProfileCreationScreenState>()
                  ?._navigateToPage(2));
            },
          )
        ],
      ),
    );
  }
}

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  String? _servicesType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            "Primary address",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const CustomTextField(
            hintText: "Enter your organization address",
            borderRadius: 5,
          ),
          const SizedBox(height: 20),
          Text(
            "City and State",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const CustomTextField(
            hintText: "Enter your city and state",
            borderRadius: 5,
          ),
          const SizedBox(height: 20),
          Text(
            "Type of services you provide",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          RadioListTile<String>(
            title: Text(
              "Kitchen",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Kitchen",
            groupValue: _servicesType,
            onChanged: (value) {
              setState(() {
                _servicesType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          RadioListTile(
            title: Text(
              "Pantry",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Pantry",
            groupValue: _servicesType,
            onChanged: (value) {
              setState(() {
                _servicesType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          RadioListTile<String>(
            title: Text(
              "Closet",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            value: "Closet",
            groupValue: _servicesType,
            onChanged: (value) {
              setState(() {
                _servicesType = value;
              });
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            activeColor: const Color(0xff2BB673),
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            title: "Continue",
            onPress: () {
              // Navigate to the next page
              (context
                  .findAncestorStateOfType<_ProfileCreationScreenState>()
                  ?._navigateToPage(3));
            },
          )
        ],
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            "Organization registration number",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          const CustomTextField(
            hintText: "Enter your organization number or tax id",
            borderRadius: 5,
          ),
          const SizedBox(height: 20),
          Text(
            "Website URL (optional)",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          const CustomTextField(
            hintText: "Enter your website link",
            borderRadius: 5,
          ),
          const SizedBox(height: 150),
          CustomElevatedButton(
            title: "Continue",
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreatePassword()));
            },
          )
        ],
      ),
    );
  }
}


