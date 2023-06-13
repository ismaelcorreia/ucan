class FormatUtil {
  static String formatStringToJson(String jsonString) {
    // Adding double quotes to the keys and values
    // "{id: 0, name: José, numberPhone: 7364739, emailAddress: jsoemsjd. c9m}"
    jsonString = jsonString.replaceAll('{', '').replaceAll('}', '');
    var arrayJson = jsonString.split(',');
    final resultLine = arrayJson
        .map((node) => node.split(':').map((key) => key = "\"$key\"").join(":"))
        .join(', ');
    return "{ $resultLine }";
  }
}
