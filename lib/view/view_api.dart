import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercoctelapp/model/model.dart';
import 'package:providercoctelapp/provider/isFavorite_provider.dart';

import '../provider/cocktail_provider.dart';
import '../widgets/tarjeta.dart';

class ViewApi extends StatelessWidget {
  const ViewApi({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktailProvider = Provider.of<CocktailProvider>(context);

    var textSize2 = MediaQuery.of(context).size.width * 0.04;
    var textSize1 = MediaQuery.of(context).size.width * 0.08;

    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: textSize1,
        ),
        title: Text('Cocktail App',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.04,
            horizontal: 10),
        child: Column(
          children: [
            //tarjeta con titulo y boton
            Container(
              width: double.infinity,
              //width: MediaQuery.of(context).size.width*0.005,

              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  opacity: 3.0,
                  image: AssetImage('assets/one.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.2),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Catalogo de Cocteles',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: textSize1,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: SizedBox(
                        //tamaño del boton
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Center(
                          child: Text('Comprar ahora',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: textSize2,
                                  fontWeight: FontWeight.bold)),
                                
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            FutureBuilder(
                //El futuro que se debe esperar.
                future: cocktailProvider
                    .fetchCocktails(), //esta es una llamada a una función que devuelve un futuro
                //El constructor de FutureBuilder espera a que este futuro se complete y proporciona los datos.
                //FutureBuilder automáticamente reconstruirá su interfaz de usuario cuando
                //cambie el estado del futuro.
                builder: (context, snapshot) {
                  //snapshot es un objeto que contiene informacion del estado actual del futuro
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            //espacio horizontal entre cards
                            crossAxisSpacing: 10,
                            //espacio vertical entre cards
                            mainAxisSpacing: 10,
                          ),
                          itemCount: cocktailProvider.cocktails
                              .length, //numero de tarjetas en base a la longitud de la lista de cocktails
                          itemBuilder: (context, index) {
                            //accedemos a un elemento especifico en la lista. index es una variable que representa la posición del elemento en la lista que queremos acceder.
                            /*esta variable contiene el cocktail en la posición específica indicada por el valor de index.
                                   Dependiendo de cuál sea el valor de index,*/
                            final cocktail = cocktailProvider.cocktails[index];
                            //print("nombre ...${cocktail.name}");
                            //print("linea que no entendi $cocktail");
                            return Tarjeta(
                                tarjeta: cocktailProvider.cocktails[index],
                                tarjetaId: index,
                                cocktail: cocktail,
                                //favoriteprovider: favoriteprovider
                                );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}       

      

      //itemCount: cocktailProvider.cocktails.length,
      //itemBuilder: (context, index) {
      //final cocktail = cocktailProvider.cocktails[index];
      /*return ListTile(
      leading: Image.network(cocktail.thumbnailUrl),
      title: Text(cocktail.name),*/
    
                
                    

/*class FutureWidget extends StatelessWidget {
  const FutureWidget({
    super.key,
    required this.cocktailProvider,
  });

  final CocktailProvider cocktailProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //El futuro que se debe esperar.
        future: cocktailProvider
            .fetchCocktails(), //esta es una llamada a una función que devuelve un futuro
//El constructor de FutureBuilder espera a que este futuro se complete y proporciona los datos.
//FutureBuilder automáticamente reconstruirá su interfaz de usuario cuando
//cambie el estado del futuro.
        builder: (context, snapshot) {
          //snapshot es un objeto que contiene informacion del estado actual del futuro
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Gridview(
                  cocktailProvider:
                      cocktailProvider), //pasamos instancia como argumento
            ));
          }
        });
  }
}

class Gridview extends StatelessWidget {
  const Gridview({
    super.key,
    required this.cocktailProvider,
  });

  final CocktailProvider cocktailProvider;

  @override
  Widget build(BuildContext context) {
    final favoriteprovider = Provider.of<FavoriteProvider>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //espacio horizontal entre cards
        crossAxisSpacing: 10,
        //espacio vertical entre cards
        mainAxisSpacing: 10,
      ),
      itemCount: cocktailProvider.cocktails
          .length, //numero de tarjetas en base a la longitud de la lista de cocktails
      itemBuilder: (context, index) {
        //accedemos a un elemento especifico en la lista. index es una variable que representa la posición del elemento en la lista que queremos acceder.
        /*esta variable contiene el cocktail en la posición específica indicada por el valor de index.
               Dependiendo de cuál sea el valor de index,*/
        final cocktail = cocktailProvider.cocktails[index];
        //print("nombre ...${cocktail.name}");
        //print("linea que no entendi $cocktail");
        return Tarjeta(
            tarjeta: cocktailProvider.cocktails[index],
            tarjetaId: index,
            cocktail: cocktail,
            favoriteprovider: favoriteprovider);
      },

      //itemCount: cocktailProvider.cocktails.length,
      //itemBuilder: (context, index) {
      //final cocktail = cocktailProvider.cocktails[index];
      /*return ListTile(
      leading: Image.network(cocktail.thumbnailUrl),
      title: Text(cocktail.name),*/
    );
  }
}
/*FutureBuilder es un widget en el framework de Flutter que se utiliza 
para manejar y construir interfaces de usuario basadas en futuros. 
En Flutter, un "futuro" representa un valor que puede estar disponible
 en algún momento en el futuro, pero no necesariamente de inmediato. 
 Los futuros son comunes cuando se trabaja con operaciones asincrónicas, 
 como la obtención de datos de una API o la lectura de un archivo.*/

/*if (snapshot.connectionState == ConnectionState.waiting) {
            print("cargando informacion");
            //print(snapshot.error);
            return Center(child: CircularProgressIndicator());

            
          }*/
*/