import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cancionero/providers/provider.dart';
import 'package:cancionero/screens/lyric.dart';

void main() => runApp(MaterialApp(
      home: Favorites(),
    ));

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   
    var myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: _favBody(myProvider.favorites)
    );
  }

  _favBody(List lst){
    if(lst.length == 0){
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
    else{
      return Container(
        color: Color.fromRGBO(241, 249, 249, 1),
        child: Row(
          children: [Expanded(
            child: ListView.builder(//se construye el widget de listado
              padding: EdgeInsets.only(top:15),
              itemBuilder: (context, index) {
                return Container(
                  child: index == 0 ? Padding(padding: EdgeInsets.zero) : _listItem(index - 1,lst,context),//se implementa una logica para generar el child, para el indice 0 se muestra _songStart y para el resto de los indices se genera el listTile
                );
              },
              itemCount: lst.length + 1,
            ),
          )],
        )
      );
    }
  }


  _listItem(i,lst,context) {//se genera el widget list tile, se pasa un indice en la lista de canciones
    final data = lst;
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
          MaterialPageRoute(builder: (context) => Lyric(data: data[i])),
          );
        },
        child: Column(children: <Widget>[//textos
        Container(
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: RichText(
            text: TextSpan(
              text: data[i]["title"],
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
