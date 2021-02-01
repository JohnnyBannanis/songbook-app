import 'package:flutter/material.dart';
import 'package:cancionero/pages/home.dart';
import 'package:cancionero/pages/index.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.list)),
              ],
              indicatorColor: Colors.white
            ),
            title: Text('Cancionero Familiar'),
          ),
          body: TabBarView(
            children: [
              Home(),
              Icon(Icons.favorite),
              Index(),
            ],
          ),
        ),
      ),
    );
  }
}