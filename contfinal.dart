//para colocar uma imagem de fundo foi necessário criar um diretório images,
//dentro do projeto, e nessa pasta foi colocado a imagem de fundo,
// mas para funcionar precisou adicionar um asset no arquivo pubspec.yaml,
// em baixo do asset: foi colocado a linha - images/restaurant.jpg,
//para salvar basta clicar em pub get e nas outras opções que estão do lado

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
    //o Stack vai configurar widgets sobrepostos
    //o widget stateful Home é chamado aqui
    home: Home(),
    //container é um local on de podemos colocar outros widgets
  ));
}

//aqui será criado um widget stateful (widget que pode ser alterado),
//funciona diferente do widget stateless (widget que não pode ser alterado)
//para criar um widget stateful, basta digitar stful e a IDE irá autocompletar
//aqui foi criada a classe home

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //para modificar o texto pessoas 0, vai ser criada uma variável
  //foi colocado o underline para a variável naõ ser acessada de fora
  //a quantidade  de pessoas começa com zero
  int _people = 0;

  //aqui será criada uma função que irá alterar o texto de baixo,
  //o texto se pode entrar ou não no restaurante
  String _infoText = "Pode Entrar!";

  //para atualizar a tela e mostarar vai ser criada a função changePeople,
  //vai atualizar a quantidade de pessoas na tela
  void _changePeople(int delta) {
    //setState irá informar ao Flutter para atualizar a tela
    setState(() {
      //aqui será somado a quantidade (podendo ser 1 ou -1)
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
    //e o home lá em cima recebe a função stateful e agora pode ser alterada
    return Stack(
      children: <Widget>[
        //o widget que vai ficar mais em baixo vem primeiro,
        //no caso é a imagem de fundo do app
        Image.asset(
          "images/restaurant.jpg",
          //aqui a imagem estará configurada para preenchimento de tela
          fit: BoxFit.cover,
          //para funcionar precisamos passar uma altura
          height: 1000.0,
        ),

        //aqui ficará os widgets sobrepostos na imagem de fundo,
        //no caso as colunas e as linhas com os botões de texto
        Column(
          //podemos alinhar o widget no centro
          mainAxisAlignment: MainAxisAlignment.center,
          //adicionamos um widget dentro com children <widget>
          children: <Widget>[
            //colocando um texto, um estilo de texto(cor, modo)
            //a variável people vai definir a quantidade de pesssoas
            Text(
              "Pessoas : $_people",
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
                //aqui fica o outro botão que também está em padding
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
              //aqui substituimos o texto pela função que vai alterar o texto,
              //a função vai mostrar um texto (se pode ou não se pode entrar)
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
