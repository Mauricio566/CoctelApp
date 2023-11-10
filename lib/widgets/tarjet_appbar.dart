import 'package:flutter/material.dart';

class TarjetAppbar extends StatelessWidget {
  const TarjetAppbar({
    super.key,
    required this.size,
  });
//
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: size.height * 0.04,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: SizedBox(
                    //tamaño del boton
                    width: size.width * 0.3,
                    height: size.height * 0.07,
                    child: Center(
                      child: Text('Comprar ahora',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold)),
                            
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        
      ],
    );
  }
}       