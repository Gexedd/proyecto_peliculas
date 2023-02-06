import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Peliculas en cines'),
        elevation:30,
        actions: [
          IconButton (
            icon: Icon(Icons.search_outlined),
            onPressed: (){},
          )
        ],
      ),
      body: Column(
        children: [
          CardSwiper()

          //Listado horizontal de peliculas
        ],
      ),

      );
  }
}
