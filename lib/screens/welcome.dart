import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cancionero/screens/start.dart';
import 'dart:ui';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animationController.repeat(
      reverse: true
      );
    _animation = Tween(begin: 2.0, end: 5.0).animate(_animationController)..addListener(() {
      setState(() {
        
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
      decoration:  BoxDecoration(
        image:  DecorationImage(//definicion de imagen de fondo, se especifica la fuente y su uso del total del espacio del contenedor
          image:  AssetImage('assets/img/fondo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child:  BackdropFilter(//filtro de imagen, se oscurece y hace borrosa
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child:  Container(//se encapsula todo el resto de la vista en este widget para que el efecto se haga presente en toda la pagina
          decoration:  BoxDecoration(color: Colors.black.withOpacity(0.4)),
          child: Column(
            children: <Widget>[
              Flexible(//se establecen widget flexible con el proposito de hacer espacio fijo y responsivo
                flex: 3,
                child: Container(),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,//texto centrado
                      text: TextSpan(
                        children: [
                          TextSpan(//primer texto en negrita con fuente mas grande
                              text: "CANCIONERO\n FAMILIAR\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35, color: Colors.grey[50])),
                          TextSpan(//segundo texto en fuente mas pequeña a la previa
                              text:
                                  "\nPara las tardes de canturreo alrededor \nde un tecito en la mesa larga",
                              style: TextStyle(fontSize: 20, color: Colors.grey[50]))
                        ],
                      ),
                    ),
                    FittedBox(//boton
                      child: GestureDetector(//se le otorga interaccion al presionar
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Start(); //cambia a la vista Start
                            },
                          ));
                        },
                        child: Container(//
                          margin: EdgeInsets.only(bottom: 80),//espacio entre el final de la vista y el boton
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),//espaciado interno para ambos ejes
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),//bordes redondeados y color
                            color: Theme.of(context).primaryColor,
                            boxShadow: [BoxShadow(
                              color: Colors.teal,
                              spreadRadius: _animation.value
                            )]
                          ),
                          child: Row(//icono de nota musical, se colorea y ajusta tamaño
                            children: <Widget>[
                              Icon(
                                Icons.music_note,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
