import 'package:flutter/material.dart';


import '../home_screen/home.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/wed.jpeg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Text(
                      "Welcome to Foodster",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        "Join our community to donate or find essential items",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF))),
                    const Text(
                        " like food, kitchen supplies, and clothing. Whether",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF))),
                    const Text(" you're here to offer help or seek support",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF))),
                    const SizedBox(height: 35),
                    buildElevatedButton(context),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(358, 48),
            backgroundColor: const Color(0xff2BB673),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Home()));
        },
        child: const Center(
          child: Text("Get Started",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF))),
        ));
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.title,
      this.titleTextStyle,


      required this.onPress,

      this.borderRadius = 10, Null Function()? onPressed});

  final String title;
  final TextStyle? titleTextStyle;

  final VoidCallback onPress;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2BB673),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            fixedSize: const Size(375, 48)),
        child: Text(
          title,
          style: titleTextStyle ??
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
        ));
  }
}
