import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SongService{
  Future<List<dynamic>> loadData() async {//funcion que retorna de manera asincrona una lista
    final resp = await rootBundle.loadString('assets/data/songs.json');//lectura de archivo
    List songs = json.decode(resp);//trasformacion del texto a objetos que quedan en la lista
    return songs;
  }

  static getFavs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('favorites') ?? '')
      .split(',')
      .where((i) => i != '')
      .map(int.parse)
      .toList();
  }

  static setFavs(List<int> values) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'favorites',
      values
        .map<String>((i) => i.toString())
        .join(',')
    );
  }
}
