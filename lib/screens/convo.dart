import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/drop_down_selection.dart';
import '../utils/unit_lists.dart';
import '../utils/colors.dart';
import '../models/converter.dart';
import '../utils/utils_function.dart';

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
    XFile? imageFile= await getImage(ImageSource.camera);
    if(imageFile!=null){
      imageFile=await cropImage(imageFile);
      String value=await getRecognisedText(imageFile!);
      setState(() {
        _inputController.text=value;
      });

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
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: IconButton(
          onPressed: selectImage,
          icon: const Icon(Icons.camera,size: 35,color: Colors.white70),
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

            //from/to
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //from
                DropDownSelection(
                    value: inputType, valueList: inputList, func: inputChange),

                //to
                DropDownSelection(
                    value: outputType,
                    valueList: outputList,
                    func: outputChange),
              ],
            ),

            //category
            DropDownSelection(
                value: categoryValue,
                valueList: categoryList,
                func: categoryChange),

            Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      final String answer = _converter.convert(
                          inputType, outputType, _inputController.text);
                      setState(() {
                        result = answer;
                      });
                    },
                    child: const Text("Convert")))
          ],
        ),
      ),
    );
  }
}
