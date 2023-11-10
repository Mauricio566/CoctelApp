/* la línea final List<dynamic> drinks = data['drinks']; se utiliza cuando 
la respuesta JSON contiene una lista de objetos. Esta línea extrae
 la lista de objetos del mapa data y la almacena en la variable drinks,
  lo que permite acceder y trabajar con cada uno de los objetos 
  contenidos en la lista.*/
/*import 'dart:convert';
import 'package:http/http.dart' as http;


import '../model/model.dart';

class CocktailService {
  final String apiUrl;

  CocktailService(this.apiUrl);
//devuelve una lista de objetos de tipo Cocktail cuando el future se complete
  Future<List<Cocktail>> fetchCocktails() async {

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      //Decodifica el cuerpo de la respuesta HTTP (en este caso es un objeto json) en un mapa de tipo Map<String, dynamic> usando la función json.decode.
      final Map<String, dynamic> data = json.decode(response.body);
      //print("map llamado data.. ${data["drinks"][""]}");
      //print("map llamado data.. ${["drinks"]}");
     
      
      // Acceder a la lista de drinks y guardarla en una variable de tipo List
      final List<dynamic> drinks = data['drinks'];
      //print("listado de drinks $drinks");
      //convierte una lista de objetos JSON en objetos de la clase Cocktail
      //map es un método que se utiliza para aplicar una función a cada elemento de la lista y crear un nuevo iterable con los resultados de esas aplicaciones.
      return drinks.map((json) => Cocktail.fromJson(json)).toList();
      //funcion map aplica una funcion a cada elemento de la lista
      // Esto es una función anónima que toma un objeto JSON y lo convierte en un objeto Cocktail utilizando el método fromJson de la clase Cocktail.
      
      
      
    } else {
      throw Exception('Failed to load cocktails');
    }
  }
}
/* print("datos obtenidos del api guardados en un mapa $data");
      //Accedo a la clave 'drinks' en el mapa data, obteniendo el valor asociado con esa clave
      final List<dynamic> drinks = data['drinks'];
      print("lista de bebidas ${drinks[0]}");
      return drinks.map((json) => Cocktail.fromJson(json)).toList();*/
      //y la convierte en un objeto de tipo Cocktail

      final Map<String, dynamic> data = json.decode(response.body);
      print("mapa de datos : $data");
      //Este método mapea los datos del mapa a las propiedades de un objeto Cocktail.
      return Cocktail.fromJson(data);*/
      /*Itera sobre cada elemento de la lista drinks.
Para cada elemento (que se asume que es un objeto JSON), lo convierte en un objeto
 Cocktail usando el método fromJson.
Retorna una lista que contiene estos objetos Cocktail. Es 
decir, se obtiene una lista de cócteles transformados desde el formato 
JSON al objeto Cocktail.*/