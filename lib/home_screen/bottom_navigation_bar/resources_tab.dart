import 'package:flutter/material.dart';

import '../components/reusable_row.dart';

class ResourcesTab extends StatelessWidget {
  const ResourcesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableRow(
              title: "Resources",
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              icon: Icons.arrow_back_ios_new_rounded,
              iconSize: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Showing list of organization near you",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1. Salvation Army",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.green),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Services:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(
              "Emergency shelter, food assistance, job training, and financial aid.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "How to Access:",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              "Visit your local Salvation Army or call their national hotline for assistance.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "2. United Way",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.green),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Services",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(
              "Provides resources for housing, food, healthcare, and employment.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "How to Access",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              "Dial 2-1-1 or visit the United Way website to find local services.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ],
        ),
      )),
    );
  }
}
