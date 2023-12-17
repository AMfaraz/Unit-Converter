final List<String> category = ["Length", "Mass", "Volume"];

final List<String> lengthList = [
  "Inch",
  "Milimeter",
  "Foot",
  "Centimeter",
  "Yard",
  "Meter",
  "Mile",
  "Kilometer"
];
final List<String> massList = [
  "Gram",
  "Ounce",
  "Pound",
  "Kilogram",
  "Ton",
  "Carat"
];
final List<String> volumeList = [
  "Liter",
  "Mililiter",
  "ImperialGallon",
  "ImperialPint"
];

final Map<String, List<String>?> categorylists = {
  "Length": lengthList,
  "Mass": massList,
  "Volume": volumeList
};

//map for conversion from shortform to longform
  Map<String, List<String>> shortToLong = {
    // Length map
    "in": ["Inch", "Length"],
    "mm": ["Milimeter", "Length"],
    "ft": ["Foot", "Length"],
    "cm": ["Centimeter", "Length"],
    "yd": ["Yard", "Length"],
    "m": ["Meter", "Length"],
    "mi": ["Mile", "Length"],
    "km": ["Kilometer", "Length"],

    // Volume map
    "l": ["Liter", "Volume"],
    "ml": ["Mililiter", "Volume"],
    "gal (Imp)": ["ImperialGallon", "Volume"],
    "pt (Imp)": ["ImperialPint", "Volume"],
  };

