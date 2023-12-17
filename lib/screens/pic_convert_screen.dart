import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../widget/drop_down_selection.dart';
import '../utils/unit_lists.dart';
import '../models/converter.dart';

class PicConvertScreen extends StatefulWidget {
  final XFile img;
  final Map<String, String> value;

  PicConvertScreen({super.key, required this.img, required this.value});

  @override
  State<PicConvertScreen> createState() => _PicConvertScreenState();
}

class _PicConvertScreenState extends State<PicConvertScreen> {
  String result = "Output";

  //from
  late List<String> inputList;
  late String inputType;

  //to
  late List<String> outputList; 
  late String outputType;

  final TextEditingController _inputController = TextEditingController();

  void outputChange(String? value) {
    setState(() {
      outputType = value!;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    String unit = widget.value["unit"]!;
    String value = widget.value["value"]!;

    inputList = categorylists[shortToLong[unit]![1]]!;
    inputType = shortToLong[unit]![0];

    outputList = categorylists[shortToLong[unit]![1]]!;
    outputType = shortToLong[unit]![0];

    _inputController.text = value;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Conversion from Pic")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //image of value
              Center(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Image.file(File(widget.img.path)),
                ),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Input",
                  hintText: "Input the value",
                ),
                controller: _inputController,
              ),

              //result
              Container(
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(17),
                    ),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Text(
                  result,
                  style: const TextStyle(color: backgroudColor, fontSize: 15),
                ),
              ),

              //to
              DropDownSelection(
                  value: outputType, valueList: outputList, func: outputChange),

              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Converter _converter=Converter();
                    final String answer = _converter.convert(
                        inputType, outputType, _inputController.text);
                    setState(() {
                      result = answer;
                    });
                  },
                  child: const Text("Convert"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
