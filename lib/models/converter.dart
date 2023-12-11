
import 'package:units_converter/units_converter.dart';

class Converter {
  var input = LENGTH.inches;
  var output = LENGTH.inches;
  
  //input
  void _selectLengthInputType(String value) {
  switch (value.toLowerCase()) {
    case "inch":
      input = LENGTH.inches;
      break;
    case "milimeter":
      input = LENGTH.millimeters;
      break;
    case "foot":
      input = LENGTH.feet;
      break;
    case "centimeter":
      input = LENGTH.centimeters;
      break;
    case "yard":
      input = LENGTH.yards;
      break;
    case "meter":
      input = LENGTH.meters;
      break;
    case "mile":
      input = LENGTH.miles;
      break;
    case "kilometer":
      input = LENGTH.kilometers;
      break;
    default:
      print("Invalid unit selected.");
      break; // This break is not strictly necessary, but it's a good practice to include it for clarity.
  }
}

  //output
  void _selectLengthOutputType(String value) {
  switch (value.toLowerCase()) {
    case "inch":
      output = LENGTH.inches;
      break;
    case "milimeter":
      output = LENGTH.millimeters;
      break;
    case "foot":
      output = LENGTH.feet;
      break;
    case "centimeter":
      output = LENGTH.centimeters;
      break;
    case "yard":
      output = LENGTH.yards;
      break;
    case "meter":
      output = LENGTH.meters;
      break;
    case "mile":
      output = LENGTH.miles;
      break;
    case "kilometer":
      output = LENGTH.kilometers;
      break;
    default:
      print("Invalid unit selected.");
      return;
  }
}

  String convert(String inputType,String outpuType,String value){
    _selectLengthInputType(inputType);
    _selectLengthOutputType(outpuType);
    double newvalue=double.parse(value);

    return newvalue.convertFromTo(input, output)!.toStringAsFixed(3);
  }
}
