import 'package:base_app/core/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../state/app_state.dart';
import '../state/app_state_builder.dart';

class DatePicker extends StatefulWidget {
  final AppState<DateTime> dateState;
  final Function() onDateChanged;

  const DatePicker({
    Key? key,
    required this.dateState,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var formatter = DateFormat.yMd(I18n.locale);

  @override
  Widget build(BuildContext context) {
    return AppStateBuilder(
      state: widget.dateState,
      builder: (_, __) {
        var date = widget.dateState.data ?? DateTime.now();
        return GestureDetector(
          onTap: () => _selectStartDate(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatter.format(date),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.date_range_outlined,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.dateState.data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != widget.dateState.data) {
      widget.dateState.value = pickedDate;
      widget.onDateChanged();
    }
  }
}
