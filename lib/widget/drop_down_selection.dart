import 'package:flutter/material.dart';
import 'package:unit_convo/utils/colors.dart';

class DropDownSelection extends StatelessWidget {
  final String value;
  final List<String> valueList;
  final func;

  const DropDownSelection(
      {super.key,
      this.value = "hello",
      required this.valueList,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        style: const TextStyle(color: backgroudColor, fontSize: 15),
        dropdownColor: buttonColor,
        value: value,
        items: valueList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: func,
      ),
    );
  }
}
