import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercoctelapp/model/model.dart';

import '../provider/cocktail_provider.dart';

class DisplayCocktails extends StatelessWidget {
  List<Drink> cocktails = [];
  DisplayCocktails({required this.cocktails, super.key});

  @override
  Widget build(BuildContext context) {
    //final cocktailsprovider = Provider.of<CocktailProvider>(context);
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            final coctelesI = cocktails[index];
            return Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(coctelesI.strDrinkThumb),
                        //NetworkImage("https://via.placeholder.com/300x400"),

                        fit: BoxFit.cover)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 35,
                      height: 30,
                      decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 114, 113, 113),
                          color: const Color.fromARGB(255, 228, 227, 227),
                          borderRadius: BorderRadius.circular(10)),
                      /*child: IconButton(
                  icon: Icon(
                    //se llama al estado actual por medio de su instancia
                    favoriteprovider.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                        //esFavorito ? Icons.favorite : Icons.favorite_border, 
                    size: 18.0,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    favoriteprovider.ChangeIconState();
                   
                  }
                    )*/
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
