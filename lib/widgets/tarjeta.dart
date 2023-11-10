/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../provider/isFavorite_provider.dart';

class Tarjeta extends StatelessWidget {
  const Tarjeta({
    super.key,
    required this.cocktail,
    //required this.favoriteprovider,
    required this.tarjeta,
    required this.tarjetaId,

  });

  final Cocktail cocktail;
  //final FavoriteProvider favoriteprovider;
  final Cocktail tarjeta;
  final int tarjetaId;

  @override
  Widget build(BuildContext context) {
   final favoriteprovider = Provider.of<FavoriteProvider>(context);
    return Card(
      //esta linea quita espacios blancos que no rellenan por completo el card
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                //accedo a una propiedad del objeto
                //thumbnailUrl es una propiedad de la instancia de la clase que representa un cocktail
                //image: NetworkImage(cocktail.thumbnailUrl),
                image: NetworkImage(tarjeta.thumbnailUrl),

                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 35,
              height: 30,
              decoration: BoxDecoration(
                  //color: Color.fromARGB(255, 114, 113, 113),
                  color: const Color.fromARGB(255, 228, 227, 227),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                /*Icondata icondata;
                if(favorite.isfavorite){
                  icondata = Icons.favorite;
                }else{
                  iconData = Icons.favorite_border;
                }
                  */
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
                  /*Provider.of<FavoriteProvider>(context,
                  listen: false).toggleFavorito(tarjetaId);*/
                }
                  )
                
              ),
            ),
          ),
        ),
      );
      
    
  }
}*/