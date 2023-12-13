import 'package:flutter/material.dart';

class DropDownSelection extends StatelessWidget {
  final String value;
  final List<String> valueList;
  final func;

  const DropDownSelection({super.key,this.value="hello",required this.valueList,required this.func});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
              value: value,
              items: valueList
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: func,
            );
  }
}






