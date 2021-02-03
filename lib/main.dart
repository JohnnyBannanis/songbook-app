import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cancionero/screens/wellcome.dart';
import 'package:provider/provider.dart';
import 'providers/provider.dart';

void main() {
//Bloquear pantalla en orientacion vertical
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(//parametros de estilo visual para el color principal
          primaryColor: Colors.teal,
        ),
        home: WelcomeScreen()
      )
    );

  }

}