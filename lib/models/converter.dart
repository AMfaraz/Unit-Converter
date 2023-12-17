
import 'package:units_converter/units_converter.dart';

class Converter {
  var err="";
  dynamic input = LENGTH.inches;
  dynamic output = LENGTH.inches;
  
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
    case "gram":
      input = MASS.grams;
      break;
    case "ounce":
      input = MASS.ounces;
      break;
    case "pound":
      input = MASS.pounds;
      break;
    case "kilogram":
      input = MASS.kilograms;
      break;
    case "ton":
      input = MASS.tons;
      break;
    case "carat":
      input = MASS.carats;
      break;
    case "liter":
      input = VOLUME.liters;
      break;
    case "mililiter":
      input = VOLUME.milliliters;
      break;
    case "imperialgallon":
      input = VOLUME.imperialGallons;
      break;
    case "imperialpint":
      input = VOLUME.imperialPints;
      break;
    default:
      err = "Invalid unit selected.";
      break;
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
    case "gram":
      output = MASS.grams;
      break;
    case "ounce":
      output = MASS.ounces;
      break;
    case "pound":
      output = MASS.pounds;
      break;
    case "kilogram":
      output = MASS.kilograms;
      break;
    case "ton":
      output = MASS.tons;
      break;
    case "carat":
      output = MASS.carats;
      break;
    case "liter":
      output = VOLUME.liters;
      break;
    case "mililiter":
      output = VOLUME.milliliters;
      break;
    case "imperialgallon":
      output = VOLUME.imperialGallons;
      break;
    case "imperialpint":
      output = VOLUME.imperialPints;
      break;
    default:
      err = "Invalid unit selected.";
      break;
  }
}

  String convert(String inputType,String outpuType,String value){
    if(err=="Invalid unit selected"){
      return err;
    }

    _selectLengthInputType(inputType);
    _selectLengthOutputType(outpuType);
    double newvalue=double.parse(value);

    return newvalue.convertFromTo(input, output)!.toStringAsFixed(3);

  }
}
