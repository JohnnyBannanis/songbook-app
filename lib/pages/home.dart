import 'package:flutter/material.dart';

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
  final cardColor = Color.fromRGBO(241, 249, 249, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(197, 231, 231, 1),
        child: Expanded(
          child: ListView(//se construye el widget de listado
            padding: EdgeInsets.only(top:15),
            children: [
              _cardTextOne(),
              _cardImgOne(),
              _cardImgTwo(),
              _cardTextTwo()
            ],
        ),
      )
      ),
    );
  }

  _cardTextOne(){
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      color: cardColor,
      child: Container(
        height: 330,
        child: Column(children: <Widget>[//textos
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 23, left: 20, right: 20),
            child: RichText(
              text: TextSpan(
                text:'"Y ocurre algo mágico, aparece una guitarra y nos juntamos, pase lo que pase. Hay canciones que salen mejores, otras no tanto, pero yo creo que aquí (la guitarra) está la alegria de mi mamá"',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic)
              ),
              textAlign: TextAlign.center
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: RichText(
              text: TextSpan(
                text: 'Juan Guerrero',    
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )
              ),
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
      ),
    );
  }

  _cardImgOne(){
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      color: cardColor,
      child: Container(
        height: 450,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/tiojuan.jpg'),//llamado a asset de imagen
              fit: BoxFit.cover,// todo el tamaño disponible
            ),
          ),
        )
      )
    );
  }

  _cardTextTwo(){
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      color: cardColor,
      child: Container(//texto al inferior de la vista
        height: 140,
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
      )
    );
  }

  _cardImgTwo(){
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      color: cardColor,
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/abuelita.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        )
      ),
    );
  }


}

