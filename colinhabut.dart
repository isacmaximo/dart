//library's necess�rias para criar o app
import 'package:flutter/material.dart';

//fun��o principal
void main() {
  //comando para rodar o app: runApp(widget);
  //widget que � o pr�pio app
  //neste caso � um app do tipo material design
  runApp(MaterialApp(
      //podemos colocar um t�tulo para o app
      title: "Contador de Pessoa",
      //colocando os widgets em modo coluna (um em cima do outro)
      home: Column(
        //podemos alinhar o widget no centro
        mainAxisAlignment: MainAxisAlignment.center,
        //adicionamos um widget dentro com children <widget>
        children: <Widget>[
          //colocando um texto, um estilo de texto(cor, modo)
          Text(
            "Pessoas : 0",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),

          //aqui ficar� uma linha no meio dos dois texto
          Row(
            children: <Widget>[
              //troquei o  FlatButton pois est� acusando de classe obsoleta
              TextButton(
                onPressed: () {},
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ],
          ),

          Text(
            "Pode entrar!",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      )
      //container � um local on de podemos colocar outros widgets

      ));
}
