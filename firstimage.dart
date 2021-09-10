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
      home: Stack(
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
              Text(
                "Pessoas : 0",
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
                      onPressed: () {},
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
        ],
      )
      //container � um local on de podemos colocar outros widgets

      ));
}
