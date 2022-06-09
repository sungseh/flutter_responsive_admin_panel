 
  
String intToTimeLeft(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  String result = "$h:$m:$s";
  return result;
}

bool doExist(var item){
  if (["", null, false, 0].contains(item)) {  
    return false;
  }  
  return true;
}

bool doNotExist(var item){
  return !doExist(item); 
}


 
// Future<bool> checkNetwork() async{
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if(connectivityResult == ConnectivityResult.none){
//     return false;
//   } else {
//     return true;
//   } 
// }

// timestampToString(Timestamp? timestamp) {
//   assert(timestamp != null);
//   String convertedDate;
//   convertedDate = DateFormat.yMMMd().add_jm().format(timestamp!.toDate());
//   return convertedDate;
// }

String? capitalize(String? text){
  // return "${string[0].toUpperCase()}${string.substring(1)}"; 
  if (text == null) throw ArgumentError("string: $text");

  if (text.isEmpty) return text;

  /// If you are careful you could use only this part of the code as 
  /// shown in the second option.
  return text
    .split(' ')
    .map((word) => word[0].toUpperCase() + word.substring(1))
    .join(' ');
}

String? removeUnderscore(String string){
  return string.replaceAll(RegExp('[\\W_]+'),' ').toLowerCase();
}
  
// String slugify(String text, {String delimiter = '-', bool lowercase = true}) {
String slugify(String text) {
  const replacements = {
    '&': 'and', 
  };

  final dupeSpaceRegExp = RegExp(r'\s{2,}');
  final punctuationRegExp = RegExp(r'[^\w\s-]');

  // Trim leading and trailing whitespace.
  var slug = text.trim();

  // Make the text lowercase (optional).
  slug = slug.toLowerCase();

  // Substitute characters for their latin equivalent.
  replacements.forEach((k, v) => slug = slug.replaceAll(k, v));

  slug = slug
      // Condense whitespaces to 1 space.
      .replaceAll(dupeSpaceRegExp, ' ')
      // Remove punctuation.
      .replaceAll(punctuationRegExp, '')
      // Replace space with the delimiter.
      .replaceAll(' ', '_');

  return slug;
}
  
// Future<Position> getUserLocation() async {
//   final currentLocation = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high
//   );

//   return currentLocation;

//   // print(currentLocation);
// }

String removeTags(String text) {
  // text = text.replaceAll('<p>', '');
  // text = text.replaceAll('</p>', '');
  text = text.replaceAll('</br>', '');
  text = text.replaceAll('<br>', ''); 
  return text;
}

String formatHomeCategories(String text) {  
  text = text.replaceAll('Sounds of the Earth', 'Sounds <br>of the Earth');
  text = text.replaceAll('Science of Sound', 'Science <br>of Sound'); 
  text = text.replaceAll('Healing Vibrations', 'Healing<br> Vibrations'); 
  text = text.replaceAll('Harmonic Visualizers', 'Harmonic<br> Visualizers'); 
  text = text.replaceAll('Sacred Movement', 'Sacred<br> Movement'); 
  return text;
}

String replaceText({required String text, required String from, required String replace}) {
  text = text.replaceAll(from, replace);
  // str = str.replaceAll('e', 'é');
  // str = str.replaceAll('i', 'I');
  // str = str.replaceAll('b', '*');
  // str = str.replaceAll('v', '<');
  return text;
}



 