import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';
import 'components/reusable_row.dart';


class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              ReusableRow(
                title: "Location",
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                icon: Icons.arrow_back_ios_new_outlined,
                iconSize: 20,
                onIconTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const BottomNavBar()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                borderRadius: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const InkWell(
                child: ReusableRow(
                  title: "Use current location",
                  textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.green,
                      fontWeight: FontWeight.w600),
                  icon: Icons.location_on_outlined,
                  iconColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Recent",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))),
              const Divider(),
              const Row(
                children: [
                  Text("Airport Courthouse"),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text("Cienega Blvd."),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text("Disney Concert Hall "),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text("Hollywood Bowl Overlook"),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
