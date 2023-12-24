import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/drop_down_selection.dart';
import '../utils/unit_lists.dart';
import '../utils/colors.dart';
import '../models/converter.dart';
import '../utils/utils_function.dart';
import '../screens/pic_convert_screen.dart';

class ConvoScreen extends StatefulWidget {
  ConvoScreen({super.key});

  @override
  State<ConvoScreen> createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  //imagefile
  XFile? imageFile;

  final Converter _converter = Converter();

  final TextEditingController _inputController = TextEditingController();

  List<String> categoryList = category;
  String categoryValue = category[0];

  //from
  List<String> inputList = categorylists["Length"]!;
  String inputType = lengthList[0];

  //to
  List<String> outputList = categorylists["Length"]!;
  String outputType = lengthList[0];

  String result = "Output";

  void categoryChange(String? value) {
    setState(() {
      categoryValue = value!;
      inputList = categorylists[value]!;
      inputType = categorylists[value]![0];
      outputList = categorylists[value]!;
      outputType = categorylists[value]![0];
    });
  }

  void inputChange(String? value) {
    setState(() {
      inputType = value!;
    });
  }

  void outputChange(String? value) {
    setState(() {
      outputType = value!;
    });
  }

  //camera scanner
  void selectImage() async {
    XFile? imageFile = await getImage(ImageSource.camera);
    if (imageFile != null) {
      imageFile = await cropImage(imageFile);
      String value = await getRecognisedText(imageFile!);
      // setState(() {
      //   _inputController.text=value;
      // });
      Map<String, String> regexed = regexing(value);

      if (regexed["value"] == null ||
          !shortToLong.containsKey(regexed["unit"])) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("No meausrement found for conversion"),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Disable'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PicConvertScreen(
                      img: imageFile!,
                      value: regexed["value"]!,
                      unit: regexed["unit"]!,
                    )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Unit Conversion")),

      //image selection
      floatingActionButton: Container(
        decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: IconButton(
          onPressed: selectImage,
          icon: const Icon(Icons.camera, size: 35, color: Colors.white70),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Input",
                        hintText: "Input the value",
                      ),
                      controller: _inputController,
                    ),
                  ),

                  //from
              DropDownSelection(
                  value: inputType, valueList: inputList, func: inputChange),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              

              //output
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //result
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
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
                ],
              ),
            

             

              const SizedBox(
                height: 20,
              ),
              //category

              //category
              DropDownSelection(
                  value: categoryValue,
                  valueList: categoryList,
                  func: categoryChange),

              const SizedBox(
                height: 20,
              ),

              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                  onPressed: () {
                    final String answer = _converter.convert(
                        inputType, outputType, _inputController.text);
                    setState(() {
                      result = answer;
                    });
                  },
                  child: const Text(
                    "Convert",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
