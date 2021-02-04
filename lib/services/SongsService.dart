import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class SongService{
  Future<List<dynamic>> loadData() async {//funcion que retorna de manera asincrona una lista
    final resp = await rootBundle.loadString('assets/data/songs.json');//lectura de archivo
    List songs = json.decode(resp);//trasformacion del texto a objetos que quedan en la lista
    return songs;
  }
}
