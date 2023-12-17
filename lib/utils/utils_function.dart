
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:unit_convo/utils/unit_lists.dart';

Future<XFile?> getImage(ImageSource source) async {
  XFile? imageFile;
  try{
      final pickedImage=await ImagePicker().pickImage(source: source);
      if(pickedImage!=null){
        imageFile=pickedImage;
      }
  }
  catch(e){
    imageFile=null;
  }
  return imageFile;

}

Future<String> getRecognisedText (XFile image)async {
  final inputImage=InputImage.fromFilePath(image.path);
  final textDetector=TextRecognizer();
  final recognizer=await textDetector.processImage(inputImage);
  return recognizer.text;
}

Future<XFile?> cropImage(XFile imgFile) async {
    final XFile? cropedImage;
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] ,
        uiSettings: [AndroidUiSettings(
      toolbarTitle: 'Image Cropper',
      toolbarColor: Colors.deepPurpleAccent,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false),
      ],
      );
      // print(croppedFile!.path);
    if (croppedFile != null) {
      cropedImage=XFile(croppedFile.path);
      return cropedImage;
    }
    else{
      cropedImage=null;
      return null;
    }
}

//for separating unit and its value
Map<String,String> regexing(String capturedValue){
  Map<String,String> mapping={};
  RegExp pattern = RegExp(r'(\d+)([a-zA-Z]+)');
  Match? match=pattern.firstMatch(capturedValue);
  
  if(match!=null){
    String valuePart=match.group(1)!;
    String unitPart=match.group(2)!;
    mapping["value"]=valuePart;
    mapping["unit"]=unitPart;
  }

  return mapping;

}

