import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cancionero/providers/provider.dart';

class Lyric extends StatefulWidget {
  //recepcion de parametros desde la vista anterior
  final data;
  const Lyric({Key key, this.data}) : super(key: key);
  @override
  _LirycPageState createState() => _LirycPageState();
}

class _LirycPageState extends State<Lyric> {
  var data;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _heartSize = 30.0;
  var _heartBgColor = Colors.teal[400];

  double _fontsize = 15;//control dinamico del tamaño de fuente
  @override
  void initState() {//estado inicial data = a data recepcionada a travez del paso de parametro
    super.initState();
    data = this.widget.data;
  }

  @override
  Widget build(BuildContext context) {
    
    List parrafos = data[0]['lyric'];
    var myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      key: _scaffoldKey,  
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: RichText(
                  text: TextSpan(
                      text: data[0]['title'],//despliegue de informacion titulo
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: RichText(
                  text: TextSpan(
                      text: data[0]['autor'],//despliegue de informacion autor
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ),
              Column(
                children: letra(parrafos),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Row(
          children: [
            Spacer(),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.remove, size: 30), 
              onPressed: () {//incrementa el tamaño de la funte
                setState(() {_decreaseFont();});
              }
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.add, size: 30), 
              onPressed: () {//incrementa el tamaño de la funte
                setState(() {_increaseFont();});
              }
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(
        (!myProvider.favorites.contains(data[1]))
          ? Icons.favorite_outline
          : Icons.favorite,
          color: Colors.white,
          size: _heartSize),
        backgroundColor: _heartBgColor, 
        onPressed: () {
          if(myProvider.favorites.contains(data[1])){
            var contained = true;
            myProvider.removeFav(data[1]);
             _scaffoldKey.currentState.showSnackBar(favSnackBar(contained));
          }
          else{
            var contained = false;
            myProvider.addFav(data[1]);
            _scaffoldKey.currentState.showSnackBar(favSnackBar(contained));
          }
        }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _increaseFont(){
    if(_fontsize <= 24){
      _fontsize++;
    }
  }

  void _decreaseFont(){
    if(_fontsize >= 14){
      _fontsize--;
    }
  }

  Widget favSnackBar(bool contained){
    if(contained == true){
      return SnackBar(
        content: Text('Eliminado de Favoritos'),
        duration: Duration(seconds :1),
        );
    }
    else{
      return SnackBar(
        content: Text('Agregado a Favoritos'),
        duration: Duration(seconds :1),
        );
    }
  }

  letra(parrafos){
    List<Widget> aux = [];
    for (var i = 0; i < parrafos.length; i++) {
      aux.add(parrafo(i));
    }
    return aux;
  }

  parrafo(i){
    return RichText(
        text:TextSpan(
            text: data[0]['lyric'][i],//despliegue de informacion letra
            style: TextStyle(
              fontSize: _fontsize,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              height: 1.1
            )),
        textAlign: TextAlign.center,
      );
  }
}