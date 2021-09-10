//Projeto C�lculo IMC - parte 3

// ignore_for_file: prefer_const_constructors

//library necess�ria para criar o app:
import 'package:flutter/cupertino.dart';
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
// ignore: use_key_in_widget_constructors
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

        //configurando corpo do aplicativo:
        //cor de fundo:
        backgroundColor: Colors.white,
        //corpo (widgets em modo coluna):
        //para colocar esse corpo para poder rolar verticalmente,
        //colocaremos a coluna dentro de um filho �nico do corpo (a rolagem)
        body: SingleChildScrollView(
          //colocando um distanciamento para n�o ficar muito colado nos cantos
          //controle de dist�ncia todos os lados no corpo
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.5),
          child: Column(
            //centralizar widgets da coluna no centro
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              //adicionando um �cone que j� tem no sistema (�cone, tamanho):
              Icon(
                Icons.person,
                size: 120.0,
                color: Colors.indigoAccent,
              ),
              //aqui colocaremos um um campo onde o usu�rio pode digitar (input):
              //queremos que esse input receba entradas do tipo n�mero:

              //input  do peso:
              TextField(
                keyboardType: TextInputType.number,
                //decora��o do text field:
                decoration: InputDecoration(
                  //label que aparecer� em cima do text field:
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
                //decora��o do text field:
                decoration: InputDecoration(
                  //label que aparecer� em cima do text field:
                  labelText: "Altura (cm)",
                  //podemos configurar o texto dessa label:
                  labelStyle: TextStyle(color: Colors.indigoAccent),
                ),
                //alinhamento do text field:
                textAlign: TextAlign.center,
                //estilo do texto de text field:
                style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
              ),

              //aqui colocaremos um padding para o bot�o n�o ficar colado no texto
              Padding(
                //aqui fica o distanciamento de cima e de baixo do bot�o
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: //*antes usava-se RaisedButton
                    //adicionando o bot�o que sobressai na tela (ElevatedButton):
                    //para alterar altura colocaremos um Container,
                    //e seu filho ser� o bot�o:
                    Container(
                  //altura do bot�o:
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    //mudando a cor:
                    style:
                        ElevatedButton.styleFrom(primary: Colors.indigoAccent),
                  ),
                ),
              ),

              //texto que ficar� abaixo de tudo (vai ser o texto informativo):
              //estar� alinhado no centro
              Text(
                "Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
              ),
            ],
          ),
        ));
  }
}
