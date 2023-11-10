

/*class Cocktail {
  final String id;
  final String name;
  final String thumbnailUrl;

  Cocktail({
    required this.id,
    
    required this.name,
    required this.thumbnailUrl,
  });
/* el método Cocktail.fromJson recibe un mapa que representa datos en
 formato JSON y crea una instancia de la clase Cocktail usando los 
 valores del mapa para inicializar sus propiedades. Es una forma 
 común de deserializar datos JSON en objetos de modelos en Flutter*/
 
  
  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      thumbnailUrl: json['strDrinkThumb'],
    );
  }
}
//El método factory para la deserialización desde JSON
Se extraen datos específicos del mapa usando las claves correspondientes
 ('idDrink', 'strDrink', 'strDrinkThumb') y se asignan a las propiedades 
 (id, name, thumbnailUrl) de la instancia de Cocktail.*/
 // To parse this JSON data, do
//
//     final saveRequestModel = saveRequestModelFromJson(jsonString);

import 'dart:convert';

CocktailModel saveRequestModelFromJson(String str) => CocktailModel.fromJson(json.decode(str));

String saveRequestModelToJson(CocktailModel data) => json.encode(data.toJson());

class CocktailModel {
    List<Drink> drinks;

    CocktailModel({
        required this.drinks,
    });

    factory CocktailModel.fromJson(Map<String, dynamic> json) => CocktailModel(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class Drink {
    String strDrink;
    String strDrinkThumb;
    String idDrink;

    Drink({
        required this.strDrink,
        required this.strDrinkThumb,
        required this.idDrink,
    });

    factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        idDrink: json["idDrink"],
    );

    Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb,
        "idDrink": idDrink,
    };
}
