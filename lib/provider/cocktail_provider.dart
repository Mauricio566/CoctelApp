//gestionara el listado de la lista de cocteles
/*define una clase llamada CocktailProvider que extiende ChangeNotifier.
 En esencia, esta clase actúa como un proveedor de datos para 
 la aplicación y utiliza el patrón Provider para administrar el 
 estado de la lista de cócteles (_cocktails) y notificar a los
  widgets interesados sobre cambios en los datos.*/
import 'package:flutter/material.dart';

import '../model/model.dart';
import '../service/service.dart';

class CocktailProvider extends ChangeNotifier {
  //se utiliza para interactuar con la API y obtener datos de cócteles.
  final CocktailService cocktailService;
// contendrá objetos de la clase Cocktail
  List<Cocktail> _cocktails = [];

  //String coctel = _cocktails[0].name;
  List<Cocktail> get cocktails => _cocktails;

  //un constructor que toma una instancia de CocktailService como
  //parámetro y la asigna a cocktailService.
  CocktailProvider(this.cocktailService);

  Future<void> fetchCocktails() async {
//se intenta obtener la lista de cocteles    
    try {
      _cocktails = await cocktailService.fetchCocktails();
      //print(_cocktails);
      //print(_cocktails[0].name.length);
      notifyListeners();
      /*for (var cocktail in _cocktails) {
      print(cocktail.name[0]); // Esto imprimirá cada objeto de bebida en la lista
}*/
      
//notifica a los widgets que esten escuchando      
      
    } catch (e) {
      print('Error fetching cocktails: $e');
    }
  }
}
/*En resumen, CocktailProvider actúa como un intermediario entre la API
 (representada por CocktailService) y los widgets de la aplicación que 
 necesitan acceder y mostrar la lista de cócteles. Cuando la lista de cócteles
  cambia (después de obtenerla de la API), CocktailProvider notifica
   a los widgets interesados para que actualicen su interfaz 
   de usuario en consecuencia.*/
