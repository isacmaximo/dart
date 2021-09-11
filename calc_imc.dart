//Projeto Cálculo IMC - calculo imc

// ignore_for_file: prefer_const_constructors

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
  //aqui vamos fazer a configuração para pegar os valores (inputs) e calcular:
  //dois objetos, dois controladores:
  //peso:
  TextEditingController weightController = TextEditingController();
  //altura:
  TextEditingController heightController = TextEditingController();

  String _infoTeste = "Informe seus dados";

  //aqui vamos fazer a função que irá resetar os inputs:
  //o underline é para indicar que é uma função privada
  void _resetFields() {
    //aqui indica que ao chamar essa função os campos vão ficar em branco
    //para os textos ficarem sendo atualizados temos que colocar no setstate
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoTeste = "Informe seus dados";
    });
  }

  //função que vai calcular o IMC
  void _calculate() {
    //vai pegar o input (texto) e transformar em double
    //para os textos ficarem sendo atualizados temos que colocar no setstate
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      //icm só mostrará dois números depois da vírgula
      if (imc < 18.6) {
        _infoTeste = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoTeste = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoTeste = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoTeste = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoTeste = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc > 40) {
        _infoTeste = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

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
              onPressed: _resetFields,
            )
          ],
        ),

        //configurando corpo do aplicativo:
        //cor de fundo:
        backgroundColor: Colors.white,
        //corpo (widgets em modo coluna):
        //para colocar esse corpo para poder rolar verticalmente,
        //colocaremos a coluna dentro de um filho único do corpo (a rolagem)
        body: SingleChildScrollView(
          //colocando um distanciamento para não ficar muito colado nos cantos
          //controle de distância todos os lados no corpo
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.5),
          child: Column(
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
                //precisamos informar qual é o controlador desse input:
                controller: weightController,
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
                //precisamos informar qual é o controlador desse input:
                controller: heightController,
              ),

              //aqui colocaremos um padding para o botão não ficar colado no texto
              Padding(
                //aqui fica o distanciamento de cima e de baixo do botão
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: //*antes usava-se RaisedButton
                    //adicionando o botão que sobressai na tela (ElevatedButton):
                    //para alterar altura colocaremos um Container,
                    //e seu filho será o botão:
                    Container(
                  //altura do botão:
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _calculate,
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

              //texto que ficará abaixo de tudo (vai ser o texto informativo):
              //estará alinhado no centro
              Text(
                //texto de baixo vai ser alterado conforme a função:
                _infoTeste,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
              ),
            ],
          ),
        ));
  }
}
