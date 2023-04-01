import 'dart:convert';
import 'package:crypto/crypto.dart';

class Helper {
  static String publicApiKey = "5e61290a4e5ec51d589fbec49ae55f96";
  static String privateApiKey = "f1f42a446c236a6316eae23e3f23e8a7d01b3aa2";
}

var url = "http://gateway.marvel.com/v1/public/"; // UBICAR LA PAGINA 
var timeStamp = DateTime.now(); // SACAR EL TIEMPO ACTUAL
var hash;//?

String gerarUrl(String assunto, {String adicional = ""}) {
  gerarHash();
  String urlFinal =
      "$url$assunto?apikey=${Helper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$adicional";
  print(urlFinal);
  return urlFinal;
}

gerarHash() {
  hash = generateMd5(
      timeStamp.toIso8601String() + Helper.privateApiKey + Helper.publicApiKey);
  print(hash);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
