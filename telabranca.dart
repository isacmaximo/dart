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
    //especificando a tela da home (exemplo de tela em branco)
    home: Container(color: Colors.white,),
    //container é um local on de podemos colocar outros widgets

  ));
}
