import 'package:flutter/material.dart';
import 'package:foodie/dashboard/start_screen.dart';
import 'package:foodie/signUp/admin_account.dart';

import '../components/reusable_row.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const ReusableRow(
                title: "Information",
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                icon: Icons.arrow_back_ios_new_rounded,
                iconSize: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [Text("About us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)), Spacer(), Icon(Icons.arrow_forward_ios, size: 20)],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Text(
                    "Privacy policy",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 20)
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [Text("Terms of condition", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)), Spacer(), Icon(Icons.arrow_forward_ios, size: 20)],
              ),
              const SizedBox(height: 50),
              CustomElevatedButton(
                  title: "Admin Account",
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminAccount()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
