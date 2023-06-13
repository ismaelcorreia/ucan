import 'dart:convert';

import 'package:lista_telefonica/model/contactoModel.dart';
import 'package:lista_telefonica/util/formatUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactoDump {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String keyList = "contactos";
  final String key = "contacto";
  Future<bool> saveContactos(List<ContactoModel> contactos) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> stringList =
        contactos.map((e) => e.toJson().toString()).toList();
    final response = await prefs.setStringList(keyList, stringList);
    return response;
  }

  Future<List<ContactoModel>> getContactos() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? stringList = prefs.getStringList(keyList);
    if (stringList != null) {
      final List<ContactoModel> list = stringList
          .map((jsonString) => ContactoModel.fromJson(
              json.decode(FormatUtil.formatStringToJson(jsonString))))
          .toList();
      return list;
    }
    return List.empty(growable: true);
  }
}
