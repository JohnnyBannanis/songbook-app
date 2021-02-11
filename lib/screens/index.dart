import 'package:flutter/material.dart';
import 'package:cancionero/screens/lyric.dart';
import 'package:cancionero/services/SongsService.dart';


class Index extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}
class _IndexPageState extends State<Index> {
  var _songs = [];//canciones
  var _songsForDisplay = [];//canciones a mostrar 
  var _input = TextEditingController();//manejo de input para busqueda

  Future getsongs() async {
    var result = await SongService().loadData();//se llama al provider y se espera respuesta
    return result;
  }

  @override
  void initState() {
    getsongs().then((value) {
      setState(() {//se establece el estado inicial haciendo que as canciones a mostrar sean igueles al total de canciones
        _songs.addAll(value);
        _songsForDisplay = _songs;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(children: <Widget>[
        Container(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.only(top:5.0,bottom: 5.0,left: 1,right: 1),
            child: Card(//carta para la barra de busqueda
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: ListTile(
                title: TextField(//campo de busqueda
                  controller: _input,//se pasa la variable al controlador del campo de texto
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Busqueda',
                      suffixIcon: IconButton(//accion al pulsar el boton "x" para limpiar campo
                          onPressed: () {
                            _input.clear();//se limpia el campo
                            setState(() {//se establece el estado a una busqueda por defecto
                              _songsForDisplay = _songs//se muestran todas las canciones
                                .where((song) =>
                                  (song["title"].toLowerCase().contains("")))//deja el campo en "vacio" para mostrar el total de las canciones
                                .toList();
                            });
                          },
                          icon: Icon(Icons.cancel))
                  ),
                  onChanged: (text) {//se llama la funcion cunado cambie el campo de busqueda
                    text = text.toLowerCase();//se maneja la variable en lowercase
                    setState(() {
                      _songsForDisplay = _songs
                          .where((song) => //desplegamos en la vista solo aquellas canciones que coincidan con la busqueda en cualquiera de los campos title lyrics y autor
                              (song["title"].toLowerCase().contains(text) ||
                                //song["lyric"].toLowerCase().contains(text) ||
                                song["autor"].toLowerCase().contains(text)
                              ))
                          .toList();
                    });
                  },
                ),
              ),
            ))),
        Expanded(
          child: ListView.builder(//se construye el widget de listado
            padding: EdgeInsets.only(top: 0.0),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(//se agrega un separador a cada tile
                  border: Border(
                      bottom: BorderSide(width: 2.5, color: Colors.teal[50])),
                ),
                child: index == 0 ? _songStart() : _listItem(index - 1),//se implementa una logica para generar el child, para el indice 0 se muestra _songStart y para el resto de los indices se genera el listTile
              );
            },
            itemCount: _songsForDisplay.length + 1,
          ),
        )
      ])
    );
  }

  _songStart() {//widget vacio para mostrar al principio de la lista generada
    return Padding(padding: EdgeInsets.zero);
  }

  _listItem(i) {//se genera el widget list tile, se pasa un indice en la lista de canciones
    final data = _songsForDisplay;
    final item = data[i];//objeto cancion
    final realIndex = _songs.indexOf(item);
    return ListTile(//campos del listtile
      tileColor: Color.fromRGBO(241, 249, 249, 1),
      contentPadding: EdgeInsets.only(left: 25, right: 16),
      title: Text(data[i]['title']),
      subtitle: Text(data[i]['autor']),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Lyric(data: [item,realIndex])),
        );//se pasa parametros a la vista LyricPage
      }
    );
  }
}
