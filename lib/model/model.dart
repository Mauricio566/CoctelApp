class Cocktail {
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
/*Se extraen datos específicos del mapa usando las claves correspondientes
 ('idDrink', 'strDrink', 'strDrinkThumb') y se asignan a las propiedades 
 (id, name, thumbnailUrl) de la instancia de Cocktail.*/