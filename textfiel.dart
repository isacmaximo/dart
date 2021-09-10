//Projeto Cálculo IMC - parte 2

//library necessária para criar o app:
import 'package:flutter/cupertino.dart';
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
// ignore: use_key_in_widget_constructors
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

      //configurando corpo do aplicativo:
      //cor de fundo:
      backgroundColor: Colors.white,
      //corpo (widgets em modo coluna):
      body: Column(
        //centralizar widgets da coluna no centro
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          //adicionando um ícone que já tem no sistema (ícone, tamanho):
          Icon(
            Icons.person,
            size: 120.0,
            color: Colors.indigoAccent,
          ),
          //aqui colocaremos um um campo onde o usuário pode digitar (input):
          //queremos que esse input receba entradas do tipo número:

          //input  do peso:
          TextField(
            keyboardType: TextInputType.number,
            //decoração do text field:
            decoration: InputDecoration(
              //label que aparecerá em cima do text field:
              labelText: "Peso (kg)",
              //podemos configurar o texto dessa label:
              labelStyle: TextStyle(color: Colors.indigoAccent),
            ),
            //alinhamento do text field:
            textAlign: TextAlign.center,
            //estilo do texto de text field:
            style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
          ),

          //input da altura:
          TextField(
            keyboardType: TextInputType.number,
            //decoração do text field:
            decoration: InputDecoration(
              //label que aparecerá em cima do text field:
              labelText: "Altura (cm)",
              //podemos configurar o texto dessa label:
              labelStyle: TextStyle(color: Colors.indigoAccent),
            ),
            //alinhamento do text field:
            textAlign: TextAlign.center,
            //estilo do texto de text field:
            style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
