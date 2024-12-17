import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:foodie/dashboard/start_screen.dart';
import 'package:foodie/signUp/profile_creation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../home_screen/components/custom_text_field.dart';
import '../home_screen/components/reusable_row.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
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
              const Text("Sign in or create\nan account",
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
                          builder: (context) => const VerificationCodeScreen(),
                        ));
                  },
                ),
              const SizedBox(height: 20),
              const Text(
                  "By registering your account tou accept our ,\nTerms of use and Privacy policy",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff242222))),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const ReusableRow(
                    title: "FOODSTERS",
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2BB673)),
                    spacing: 90,
                    icon: Icons.cancel_outlined,
                    iconColor: Color(0xff2BB673),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Let’s confirm your email",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Enter the six digit code sent to ****alpha@gmail.com",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: const Color(0xff2BB673),
                      selectedColor: const Color(0xff2BB673),
                      inactiveColor: Colors.grey,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (v) {
                     log("Completed: $v");
                    },
                    onChanged: (value) {
                      log("Changed: $value");
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Didn’t receive the code? Resend it",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 400),
                  Center(
                    child: CustomElevatedButton(
                        title: "Verify",
                        titleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),

                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileCreationScreen(),
                              ));
                        },
                       ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
