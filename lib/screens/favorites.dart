import 'package:flutter/material.dart';
import 'package:cancionero/screens/lyric.dart';
import 'package:cancionero/services/SongsService.dart';

class Favorites extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<Favorites> {
  var favs = [];
  var songs = [];

  Future getInfo() async {
    var result1 = await SongService().loadData();//se llama al provider y se espera respuesta
    var result2 = await SongService.getFavs();
    return [result1, result2];
  }
  @override
  void initState() {
    getInfo().then((value) {
      setState(() {//se establece el estado inicial haciendo que as canciones a mostrar sean igueles al total de canciones
        songs.addAll(value[0]);
        favs.addAll(value[1]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _favBody(favs, songs)
    );  
  }

  _favBody(List favList, songList){
    if(favList.length == 0){
      return Container(
        color: Color.fromRGBO(241, 249, 249, 1),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.favorite,color: Colors.teal,size: 35),
                Text("Sin Favoritos aun",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
        ),
      );
    }
    else {
      return Container(
        color: Color.fromRGBO(241, 249, 249, 1),
        child: Column(
          children: [Expanded(
            child: ListView.builder(//se construye el widget de listado
              padding: EdgeInsets.only(top:15),
              itemCount: favList.length + 1,
              itemBuilder: (context, index) {
                return Container(
                  child: index == 0 ? Padding(padding: EdgeInsets.zero): _listItem(index - 1,context),//se implementa una logica para generar el child, para el indice 0 se muestra _songStart y para el resto de los indices se genera el listTile
                );
              },
            ),
          )],
        )
      );
    }
  }


  _listItem(i, context) {//se genera el widget list tile, se pasa un indice en la lista de canciones
    final data = songs.elementAt(favs[i]);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      color: Colors.teal[200],
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        highlightColor: Colors.teal[400],
        splashColor: Colors.teal,
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Lyric(data: [data,favs[i]])),
          );
        },
        child: Column(children: <Widget>[//textos
        Container(
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: RichText(
            text: TextSpan(
              text: data["title"],
              style: TextStyle(
                fontSize: 18,
                color: Colors.black)
            ),
            textAlign: TextAlign.start
          )
        )]
        )
      )
    );
  }
}
