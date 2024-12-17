import 'package:flutter/material.dart';

import '../../dashboard/start_screen.dart';
import '../../home_screen/home.dart';

class Publish extends StatelessWidget {
  const Publish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                height: 168,
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/check-circle.png")),
                    Text(
                      "All done!",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Your listing has been uploaded \n               successfully",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 250),
            CustomElevatedButton(
              title: "Go to home",
              titleTextStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
