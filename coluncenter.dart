
//librarys necessárias para criar o app
import 'package:flutter/material.dart';

//função principal
void main (){
  //comando para rodar o app: runApp(widget);
  //widget que é o própio app
  //neste caso é um app do tipo material desingn
  runApp(MaterialApp(
    //podemos colocar um título para o app
    title: "Contador de Pessoas",
    //colocando os widgets em modo cluna (um em cima do outro)
    home: Column(
      //podemos alinhar o widget no centro
      mainAxisAlignment: MainAxisAlignment.center ,
      //adicionamos um widget dentro com children <widget>
      children: <Widget>[
        //colocando um texto, um estilo de texto(cor, modo)
        Text("Pessoas : 0",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
              fontSize: 30.0),),
        Text("Pode entrar!",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,
              fontSize: 30.0),)
      ],

    )

  ));
}
