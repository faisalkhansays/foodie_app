import 'package:flutter/material.dart';
import 'package:foodie/dashboard/start_screen.dart';



import '../../components/reusable_row.dart';
import '../../home.dart';


class SelectedDonation extends StatelessWidget {
  const SelectedDonation({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReusableRow(title: "Summary", textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 24), icon: Icons.arrow_back),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/Frame 361.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            "Help us in raising money to run this platform",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text("Donate once",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ))
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment Method",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "No payment method",
                              hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                        child: VerticalDivider(
                          width: 10,
                          thickness: 2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          "assets/button.png",
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 400,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text("Total",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          const Spacer(),
                          Text(price,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomElevatedButton(
                        title: "Continue",
                        titleTextStyle: const TextStyle(color: Colors.white),
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                        },
                      )
                    ],
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
