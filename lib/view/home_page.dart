import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercoctelapp/model/model.dart';
import 'package:providercoctelapp/provider/isFavorite_provider.dart';

import '../provider/cocktail_provider.dart';
import '../widgets/display_cocktails.dart';
import '../widgets/tarjet_appbar.dart';
import '../widgets/tarjeta.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktailsprovider = Provider.of<CocktailProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: MenuAppbar(size),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: size.height * 0.04, horizontal: 10),

        //tarjeta del appbar
        child: Column(
          children: [
            TarjetAppbar(size: size),
            DisplayCocktails(cocktails: cocktailsprovider.cocktails),
          ],
        ),
      ),
    );
  }

  AppBar MenuAppbar(Size size) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.menu,
        color: Colors.white,
        size: size.width * 0.08,
      ),
      title: Text('Cocktail App',
          style: TextStyle(
            fontSize: size.width * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

