//gestionara el listado de la lista de cocteles
/*define una clase llamada CocktailProvider que extiende ChangeNotifier.
 En esencia, esta clase actúa como un proveedor de datos para 
 la aplicación y utiliza el patrón Provider para administrar el 
 estado de la lista de cócteles (_cocktails) y notificar a los
  widgets interesados sobre cambios en los datos.*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../service/service.dart';

//'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin'
class CocktailProvider extends ChangeNotifier {
  String _baseUrl =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin";

  List<Drink> cocktails = [];

  CocktailProvider() {
    print("provider inicializado");
    DisplayCocteles();
  }

  DisplayCocteles() async {
     final response = await http.get(Uri.parse(_baseUrl));
    final mapeado = saveRequestModelFromJson(response.body);
    cocktails = mapeado.drinks;
    print("respuesta ya preparada :)...${cocktails[0].strDrink}");
    notifyListeners();

  }
}
