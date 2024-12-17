import 'package:flutter/material.dart';
import 'package:foodie/dashboard/all_listings.dart';

import 'package:foodie/dashboard/start_screen.dart';

import '../home_screen/components/custom_text_field.dart';
import '../home_screen/components/reusable_row.dart';



class AdminAccount extends StatelessWidget {
  const AdminAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const ReusableRow(
                  title: "FOODSTERS",
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2BB673)),
                  spacing: 100,
                  icon: Icons.cancel_outlined,
                  iconColor: Color(0xff2BB673),
                ),
                const SizedBox(height: 70),
                const Text("Admin account",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff242222))),
                const SizedBox(height: 80),
                const Text("Email",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff242222))),
                const SizedBox(height: 10),
                const CustomTextField(
                  hintText: "Enter your email address",
                  borderRadius: 5,
                ),
                const SizedBox(height: 20),
                const Text("Password",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff242222))),
                const SizedBox(height: 10),
                const CustomTextField(
                  hintText: "Enter your password",
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  borderRadius: 5,
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  title: "Continue",
                  titleTextStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const AllListings(),
                        ));
                  },
                ),
                const SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
