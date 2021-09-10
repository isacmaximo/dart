//nesse código tem as primeiras configurações de padding nos textbuttons

//library's necessárias para criar o app
import 'package:flutter/material.dart';

//função principal
void main() {
  //comando para rodar o app: runApp(widget);
  //widget que é o própio app
  //neste caso é um app do tipo material design
  runApp(MaterialApp(
      //podemos colocar um título para o app
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

          //aqui ficará uma linha no meio dos dois texto
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //troquei o  FlatButton pois está acusando de classe obsoleta
              //o padding serve para configurar distância entre widgets
              //no caso como eu quero um espaço igual nas laterais,
              //o padding vai ser EdgeInsets.all
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ),
              //aqui fica o outro botão que também está em padding
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "-1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
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
      //container é um local on de podemos colocar outros widgets

      ));
}
