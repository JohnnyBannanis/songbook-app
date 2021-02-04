import 'package:flutter/material.dart';
import 'package:cancionero/screens/home.dart';
import 'package:cancionero/screens/index.dart';
import 'package:cancionero/screens/favorites.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            Favorites(),
            Index(),
          ],
        ),
      ),
    );
  }
}