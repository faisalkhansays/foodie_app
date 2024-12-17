import 'package:flutter/material.dart';

import '../../../../dashboard/start_screen.dart';
import 'price_widget.dart';
import 'selected_donation.dart';
class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet(BuildContext context, {super.key});

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  @override
  Widget build(BuildContext context) {
    String? selectedPrice;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select donation amount',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          PriceWidget(
            onPriceSelected: (price) {
              setState(() {
                selectedPrice = price;
              });
            },
          ),
          const SizedBox(height: 10.0),
          const SizedBox(height: 20.0),
          const Text(
            'Other amount',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Colors.grey[150],
              prefixIcon: const Icon(Icons.currency_exchange_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          CustomElevatedButton(
            title: "Continue",
            titleTextStyle: const TextStyle(color: Colors.white),
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedDonation(
                        price: selectedPrice ?? '',
                      )));
            },
          ),
        ],
      ),
    );
  }
}

