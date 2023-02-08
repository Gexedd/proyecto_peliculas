import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_peliculas/providers/movies_provider.dart';
import 'package:proyecto_peliculas/screens/screens.dart';


void main() => runApp(AppState()); //Se sube el AppState al void para que sea lo primero que se ejecute

//Se crea aquí un nuevo Widget para el provider
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider
      (providers: [
        ChangeNotifierProvider(create: (_)=>MoviesProvider() ,lazy: false, ),

    ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':( _ )=> HomeScreen(),
        'details':( _ )=> DetailsScreen(),
      },

      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
        )
      )

    );
  }
}
