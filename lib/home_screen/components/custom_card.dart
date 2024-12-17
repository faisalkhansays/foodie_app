import 'package:flutter/material.dart';
import 'package:foodie/constants_color.dart';

import 'reusable_row.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "assets/jjr.jpeg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Soups and Stews",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    ReusableRow(
                      title: "Feeding America",
                      icon: Icons.arrow_forward_ios,
                    ),
                    Spacer(),
                    ReusableRow(
                      title: "0.5km",
                      icon: Icons.near_me_outlined,
                      iconColor: Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ReusableRow(
                  title: "23 Main St, New York, NY",
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const ReusableRow(
                      title: "Aug 15, 2024",
                      icon: Icons.calendar_month,
                    ),
                    const Spacer(),
                    Container(
                      height: 38,
                      width: 150,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "6:00-9:30PM",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
