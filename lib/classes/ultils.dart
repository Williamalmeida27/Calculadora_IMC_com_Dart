import 'dart:convert';
import 'dart:io';

class Utils {
  static String lerTexto(String msg) {
    print(msg);
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? inputConvert(String msg) {
    var texto = lerTexto(msg);
    try {
      return double.parse(texto);
    } catch (e) {
      return null;
    }
  }
}
