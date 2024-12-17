import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField2 extends StatefulWidget {
  const CustomTextField2({
    super.key,
    required this.hintText,
    this.maxLines,
    this.showDatePicker = false, // Control whether DatePicker is shown
    this.showTimePicker = false, // Control whether TimePicker is shown
  });

  final String hintText;
  final int? maxLines;
  final bool showDatePicker;
  final bool showTimePicker;

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  final TextEditingController _controller = TextEditingController();

  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('MM/dd/yyyy').format(selectedDate);
      setState(() {
        _controller.text = formattedDate;
      });
    }
  }

  // Method to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(
        DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute),
      );
      setState(() {
        _controller.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.showDatePicker
            ? IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today_outlined),
              )
            : widget.showTimePicker
                ? IconButton(
                    onPressed: () => _selectTime(context),
                    icon: const Icon(Icons.access_time_outlined),
                  )
                : null,
        // Show icon only if date or time picker is enabled
        filled: true,
        fillColor: const Color(0xffF5F7F9),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
