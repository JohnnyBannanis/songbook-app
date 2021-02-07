import 'package:flutter/foundation.dart';
import 'package:cancionero/services/SongsService.dart';

class MyProvider with ChangeNotifier {

  List _favorites = [];
  List<dynamic> _songs = [];

  List get favorites => _favorites; 
  List get songs => _songs;

  MyProvider(){
    _initData();
  }
  
  void _initData() async {
    _loadSongs();
    _loadFavs();
  }

  void _loadSongs() async {
    _songs = await SongService().loadData();
    notifyListeners();
  }

  void _loadFavs() async {
    _favorites = await SongService.getFavs();
    notifyListeners();
  }

  void addFav(int item) async {
    _favorites.add(item);
    await SongService.setFavs(_favorites);
    notifyListeners();
  }

  void removeFav(int item) async {
    _favorites.remove(item);
    await SongService.setFavs(_favorites);
    notifyListeners();
  }
}
