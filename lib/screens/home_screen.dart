import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peliculas/providers/movies_provider.dart';
import 'package:proyecto_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [

                //Tarjetas Principales
                CardSwiper(movies: moviesProvider.onDisplayMovies),

                //Slider inferior de peliculas
                MovieSlider(),
              ],
            ),
          ],
        ),
      )

      );
  }
}
