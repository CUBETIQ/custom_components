import 'dart:convert';

class CConsole {
  static final CConsole _singleton = CConsole._internal();

  factory CConsole() {
    return _singleton;
  }

  static void log(text, anyObj) {
    final textLength = text.toString().length + 4;
    print(" " + '-' * textLength);
    print("|  " + text + "  |");
    print(" " + '-' * textLength);
    print(anyObj);
    print("==============================");
    print("==============================");
  }

  static void json(data) {}

  static void jsonAll(data) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettylint = encoder.convert(data);

    prettylint
        .split('\n')
        .forEach((element) => CConsole.log("Render JSON", prettylint));
  }

  CConsole._internal();
}
