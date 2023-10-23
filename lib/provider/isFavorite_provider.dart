import 'package:flutter/material.dart';

//clase de modelo que representa el cambio de estado del icono. 
class FavoriteProvider extends ChangeNotifier {
  //se inicializa el valor
  bool _isfavorite = false;
  //Map<int ,bool> _esfavorito = {};

  /*bool getisFavorite(int tarjetaId){
    return _esfavorito[tarjetaId] ??
    false;
  } */

  /*oid toggleFavorito(int tarjetaId){
    _esfavorito[tarjetaId] = !
    _esfavorito[tarjetaId] !;
    notifyListeners();
  }*/

//devuelve el valor de mi estado actual
  bool get isFavorite => _isfavorite; 

  FavoriteProvider() {}


// ignore: non_constant_identifier_names
void ChangeIconState(){
    //invertimos el valor actual de _isfavorite(al aplicar la negacion ! si es false cambia a true y viceversa) 
    _isfavorite = !_isfavorite;
    //se informa a los oyentes(widgets) que el estado ha cambiado
    notifyListeners();
   }
}
