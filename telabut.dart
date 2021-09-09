//library's necessárias para criar o app
import 'package:flutter/material.dart';

void funcvazia(){

}

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
        children: const <Widget>[
          //colocando um texto, um estilo de texto(cor, modo)
          Text(
            "Pessoas : 0",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),

          //botão  aqui está no meio dos dois textos
          FlatButton(
            child: Text(
              "+1",
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            ),
            onPressed: funcvazia,
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
