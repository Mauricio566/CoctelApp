import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercoctelapp/provider/cocktail_provider.dart';
import 'package:providercoctelapp/provider/isFavorite_provider.dart';
import 'package:providercoctelapp/service/service.dart';
import 'package:providercoctelapp/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  

    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => CocktailProvider(),lazy: false,),
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
        initialRoute: "home",
        routes: {
          "home":( _ ) => HomePage(),
        //"details":( _ ) => DetailsScreen(),
        },
      ),
    );
  }
}

