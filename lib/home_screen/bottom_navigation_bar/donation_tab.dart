import 'package:flutter/material.dart';
import 'package:foodie/constants_color.dart';
import 'package:foodie/dashboard/start_screen.dart';
import '../components/reusable_row.dart';
import 'components/bottom_sheet.dart';


class DonationTab extends StatefulWidget {
  const DonationTab({super.key});

  @override
  State<DonationTab> createState() => _DonationTabState();
}

class _DonationTabState extends State<DonationTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const ReusableRow(
                title: "Donate",
                icon: Icons.arrow_back_ios_new_rounded,
                iconSize: 20,
                iconColor: primary,
                textStyle: TextStyle(fontSize: 20, color: primary, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              const Image(image: AssetImage("assets/Frame 361.png")),
              const SizedBox(
                height: 25,
              ),
              const Text("Help us in raising money to run this platform", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet consectetur. Phasellus pulvinar dolor commodo risus. Arcu nibh phasellus laoreet egestas tellus. Sed viverra nibh sollicitudin quis tempus dignissim massa. Egestas leo nec diam tellus sed habitasse a lacinia hac.s",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              const SizedBox(
                height: 40,
              ),
              const Align(alignment: Alignment.centerLeft, child: Text('Donation raised', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
              const SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                value: 0.5,
                minHeight: 10,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff71CEA1)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(alignment: Alignment.centerRight, child: Text('\$2500 / \$5000', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
              const SizedBox(
                height: 100,
              ),
              CustomElevatedButton(
                title: 'Continue',
                titleTextStyle: const TextStyle(color: Colors.white),
                borderRadius: 10,
                onPress: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BuildBottomSheet(context);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
