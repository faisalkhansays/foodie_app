import 'package:flutter/material.dart';

import 'custom_outlined_button.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({super.key, required this.onPriceSelected});

  final ValueChanged<String?> onPriceSelected;

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}
class _PriceWidgetState extends State<PriceWidget> {
  int _selectedIndex = -1;
  final List<String> _prices = [
    '\$5',
    '\$10',
    '\$20',
    '\$50',
    '\$100',
    '\$200',
  ];

  dynamic _buttonSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? get selectedPrice => _selectedIndex != -1 ? _prices[_selectedIndex] : null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        spacing: 12.0, // Spacing between buttons
        runSpacing: 10.0, // Spacing between lines when wrapped
        alignment: WrapAlignment.center, // Align the buttons in the center
        children: List.generate(6, (index) {
          return CustomOutlinedButton(
            title: _prices[index],
            onPress: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onPriceSelected(_prices[index]);
            },
            isSelected: _selectedIndex == index,
          );
        }),
      ),
    );
  }
}