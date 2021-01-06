import 'package:flutter/material.dart';

void main() {
  runApp(Lyric());
}

class Lyric extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyric',
      debugShowCheckedModeBanner: false,
      home: LyricPage(),
    );
  }
}

class LyricPage extends StatefulWidget {
  //recepcion de parametros desde la vista anterior
  final data;
  const LyricPage({Key key, this.data}) : super(key: key);

  @override
  _LirycPageState createState() => _LirycPageState();
}

class _LirycPageState extends State<LyricPage> {
  var data;
  double _fontsize = 15;//control dinamico del tamaño de fuente
  @override
  void initState() {//estado inicial data = a data recepcionada a travez del paso de parametro
    super.initState();
    data = this.widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Cancionero Familiar"),
        elevation: 6,
      ),
      floatingActionButton: _btnActions(),//se genera el widget FAV desde funcion
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: RichText(
                  text: TextSpan(
                      text: data['title'],//despliegue de informacion titulo
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
                      text: data['autor'],//despliegue de informacion autor
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: data['lyric'],//despliegue de informacion letra
                    style: TextStyle(
                      fontSize: _fontsize,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    )),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnActions() {//funcion que genera los botones
    return Column(//retorna una columna para desplegar todos los botones
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(// boton +
            heroTag: "btn1",
            child: Icon(Icons.add),
            onPressed: () {//incrementa el tamaño de la funte
              setState(() {
                _fontsize++;
              });
            }),
        FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.remove),
            onPressed: () {//disminuye el tamaño de la funte
              setState(() {
                _fontsize--;
              });
            }),
        SizedBox(height: 10,),//espacio en blanco
        FloatingActionButton(//tercer boton para logica de favoritos (NO IMPLEMENTADO)
            
            heroTag: "btn3",
            child: Icon(Icons.favorite_border),
            onPressed: () {}),
      ],
    );
  }
}
