// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShoesFilterChip extends StatelessWidget {
  final String label;
  final Function funcHandler;
  bool selected = false;
  ShoesFilterChip({
    Key? key,
    required this.label,
    required this.funcHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: SizedBox(
        width: 100,
        height: 30,
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      pressElevation: 0,
      selected: selected,
      onSelected: (bool value) {
        selected = !selected;
        funcHandler();
      },
      selectedColor: const Color.fromARGB(255, 87, 87, 87),
      backgroundColor: const Color.fromARGB(255, 186, 186, 186),
      showCheckmark: false,
    );
  }
}
