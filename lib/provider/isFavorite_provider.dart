import 'package:flutter/material.dart';

//clase de modelo que representa el cambio de estado del icono. 
class FavoriteProvider extends ChangeNotifier {
  //se inicializa el valor
  bool _isfavorite = false;
 
  bool get isFavorite => _isfavorite; 

  //FavoriteProvider() {}


// ignore: non_constant_identifier_names
void ChangeIconState(){
    //invertimos el valor actual de _isfavorite(al aplicar la negacion ! si es false cambia a true y viceversa) 
    _isfavorite = !_isfavorite;
    //se informa a los oyentes(widgets) que el estado ha cambiado
    notifyListeners();
   }
}
