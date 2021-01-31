import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(Home());
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                child: CarouselSlider(//widget de carrusel
                  options: CarouselOptions(//parametros de configuracion
                    height: 425,
                    viewportFraction: 0.9,//porte de contenido
                    initialPage: 0,//defaut view
                    enableInfiniteScroll: true,//scroll infinito, 
                    autoPlay: false,//autoscroll y tiempo asociado
                    autoPlayInterval: Duration(seconds: 9),
                    autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  ),
                  items: [1, 2, 3].map((i) {
                    if (i == 1) {//tarjeta para la pocicion 1
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,//ancho de pantalla
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(//tarjeta contenedora del texto
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal[100]),
                            child: Column(children: <Widget>[//textos
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 30, bottom: 23, left: 20, right: 20),
                                  child: RichText(
                                      text: TextSpan(
                                          text:
                                              '"Y ocurre algo mágico, aparece una guitarra y nos juntamos, pase lo que pase. Hay canciones que salen mejores, otras no tanto, pero yo creo que aquí (la guitarra) está la alegria de mi mamá"',
                                          style: TextStyle(
                                              fontSize: 29,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic)),
                                      textAlign: TextAlign.center)),
                              Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Juan Guerrero',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ),
                              Container(
                                child: RichText(
                                  text: TextSpan(
                                      text: '(Noviembre 2019)',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ]),
                          );
                        },
                      );
                    }
                    else if(i == 2){//tarjeta para la pocicion 2
                    return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),//bordes redondeados
                                image: DecorationImage(
                                  image: AssetImage('assets/img/tiojuan.jpg'),//llamado a asset de imagen
                                  fit: BoxFit.cover,// todo el tamaño disponible
                                ),
                              ),
                            )
                          );
                        },
                      );
                    }
                    else if(i == 3){//tarjeta para la pocicion 3
                    //igual a la anterior con distinto asset
                    return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage('assets/img/abuelita.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          );
                        },
                      );
                    }
                  }).toList(),//trasformacion a lista del map con los widgets
                )
            ),
            
            Container(//texto al inferior de la vista
              margin: EdgeInsets.only(top: 19, right:10, left:10 ),
              child: RichText(
                text: TextSpan(
                  text: 'Este cancionero es parte del tesoro musical de nuestra familia.\n\n En memoria de nuestro querido Juan\n Agosto, 2020 ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    )),
                textAlign: TextAlign.center
              ),
            ),
          ],
        ),
      ),
    );
  }
}
