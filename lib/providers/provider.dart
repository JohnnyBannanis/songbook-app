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
    _songs = await SongService().loadData();
    notifyListeners();
  }

  set myfavs(List newFavs) {
    _favorites = newFavs; 
    notifyListeners(); 
  }

}
