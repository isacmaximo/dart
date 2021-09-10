//Projeto Cálculo IMC

//library necessária para criar o app:
import 'package:flutter/material.dart';

//função principal
void main() {
  //widget app:
  runApp(MaterialApp(
    //iniciando com a home:
    //usaremos um stateful widget, pois queremos interagir com a tela
    home: Home(),
  ));
}

//criando o widget stateful que vai ser a home:
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //aqui será o layout:
    //scaffold server para adicionar app bar (barra de cima) e coisas do tipo
    return Scaffold(
      //configurações da AppBar:
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        //centralizando o título:
        centerTitle: true,
        //cor do AppBar:
        backgroundColor: Colors.indigoAccent,
        //colocando o botão de refresh na AppBar:
        actions: <Widget>[
          //botão com um ícone:
          IconButton(
            //botão de refresh:
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
