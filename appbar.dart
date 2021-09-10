//Projeto C�lculo IMC

//library necess�ria para criar o app:
import 'package:flutter/material.dart';

//fun��o principal
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
    //aqui ser� o layout:
    //scaffold server para adicionar app bar (barra de cima) e coisas do tipo
    return Scaffold(
      //configura��es da AppBar:
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        //centralizando o t�tulo:
        centerTitle: true,
        //cor do AppBar:
        backgroundColor: Colors.indigoAccent,
        //colocando o bot�o de refresh na AppBar:
        actions: <Widget>[
          //bot�o com um �cone:
          IconButton(
            //bot�o de refresh:
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
