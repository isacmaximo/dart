//para colocar uma imagem de fundo foi necess�rio criar um diret�rio images,
//dentro do projeto, e nessa pasta foi colocado a imagem de fundo,
// mas para funcionar precisou adicionar um asset no arquivo pubspec.yaml,
// em baixo do asset: foi colocado a linha - images/restaurant.jpg,
//para salvar basta clicar em pub get e nas outras op��es que est�o do lado

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
    //o Stack vai configurar widgets sobrepostos
    //o widget stateful Home � chamado aqui
    home: Home(),
    //container � um local on de podemos colocar outros widgets
  ));
}

//aqui ser� criado um widget stateful (widget que pode ser alterado),
//funciona diferente do widget stateless (widget que n�o pode ser alterado)
//para criar um widget stateful, basta digitar stful e a IDE ir� autocompletar
//aqui foi criada a classe home

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //para modificar o texto pessoas 0, vai ser criada uma vari�vel
  //foi colocado o underline para a vari�vel na� ser acessada de fora
  //a quantidade  de pessoas come�a com zero
  int _people = 0;

  //aqui ser� criada uma fun��o que ir� alterar o texto de baixo,
  //o texto se pode entrar ou n�o no restaurante
  String _infoText = "Pode Entrar!";

  //para atualizar a tela e mostarar vai ser criada a fun��o changePeople,
  //vai atualizar a quantidade de pessoas na tela
  void _changePeople(int delta) {
    //setState ir� informar ao Flutter para atualizar a tela
    setState(() {
      //aqui ser� somado a quantidade (podendo ser 1 ou -1)
      _people += delta;
      //aqui colocaremos as condicionais
      if (_people < 0) {
        _people = 0;
      } else if (_people >= 0 && _people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _people = 10;
        _infoText = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //toda a parte que estava em home (a partir de stack) vai para o return,
    //e o home l� em cima recebe a fun��o stateful e agora pode ser alterada
    return Stack(
      children: <Widget>[
        //o widget que vai ficar mais em baixo vem primeiro,
        //no caso � a imagem de fundo do app
        Image.asset(
          "images/restaurant.jpg",
          //aqui a imagem estar� configurada para preenchimento de tela
          fit: BoxFit.cover,
          //para funcionar precisamos passar uma altura
          height: 1000.0,
        ),

        //aqui ficar� os widgets sobrepostos na imagem de fundo,
        //no caso as colunas e as linhas com os bot�es de texto
        Column(
          //podemos alinhar o widget no centro
          mainAxisAlignment: MainAxisAlignment.center,
          //adicionamos um widget dentro com children <widget>
          children: <Widget>[
            //colocando um texto, um estilo de texto(cor, modo)
            //a vari�vel people vai definir a quantidade de pesssoas
            Text(
              "Pessoas : $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),

            //aqui ficar� uma linha no meio dos dois texto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //troquei o  FlatButton pois est� acusando de classe obsoleta
                //o padding serve para configurar dist�ncia entre widgets
                //no caso como eu quero um espa�o igual nas laterais,
                //o padding vai ser EdgeInsets.all
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      //aqui a quantidade de pessoas vai aumentando
                      _changePeople(1);
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                //aqui fica o outro bot�o que tamb�m est� em padding
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      //aqui a quantidade de pessoas vai reduzindo
                      _changePeople(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Text(
              //aqui substituimos o texto pela fun��o que vai alterar o texto,
              //a fun��o vai mostrar um texto (se pode ou n�o se pode entrar)
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
