import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercoctelapp/provider/cocktail_provider.dart';
import 'package:providercoctelapp/provider/isFavorite_provider.dart';
import 'package:providercoctelapp/service/service.dart';
import 'package:providercoctelapp/view/view_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final apiUrl = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin';
    //se crea una instancia del servicio y se pasa su argumento
    final cocktailService = CocktailService(apiUrl);

    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => CocktailProvider(cocktailService),),
        //proporciona una instancia de este modelo en la parte superior de mi widget tree
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),

       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ViewApi(),
      ),
    );
  }
}

