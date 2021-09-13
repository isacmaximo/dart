//Conversor de Moedas - Convertendo valores das moedas nos campos

//usaremos uma API (ponte para pegar informações) para pegar os dados
//precisamos incluir o pacote http no arquivo pubspec.yaml
//colocaremos abaixo de cupertino_icons (tem que ser alinhado)

//library necessária para criar o app
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//library necessária para fazer a requisição http:
import 'package:http/http.dart' as http;

//library necessária para fazer requisição assíncrona, ou seja para que
//o app não pare para receber as informações, quando recebe faz alguma coisa,
import 'dart:async';

//library para transformar os dados em json:
import 'dart:convert';

//aqui colocaremos a url, como é uma constante então podemos usar const.
const request = "https://api.hgbrasil.com/finance?format=json&key=cb5fa7da";

//função principal
//colocamos async pois vamos utilizar coisas assíncronas (dados da API)
void main() async {
  //condições iniciais para criar o app:
  runApp(MaterialApp(
      //home e theme.
      home: Home(),
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          ))));
}

//função que irá retornar um dado futuro:
//no caso vai ser um map
Future<Map> getData() async {
  //fazendo uma requisição assíncrona:
  //primeiro fazemos algo que pega essas informações da API:
  //colocamos await para esperar essas informações
  http.Response response = await http.get(Uri.parse(request));
  //aqui há o retorno no formato json
  return json.decode(response.body);
}

//stateless
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //controladores dos textfields:
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  //variáveis que vão receber os valores das moedas:
  //temos que declarar o late antes das variáveis:
  late double dolar;
  late double euro;

  //funções de verificação de mudança do conteúdos dos inputs
  //cada função dessa vai pegar o valor da moeda e converter para as outras duas:
  void _realChanged(String text) {
    //transformando o que foi recebido no input em double
    double real = double.parse(text);
    //transformando os controladores dos inputs em suas respectivas moedas:
    //apenas duas casas depois da vírgula no caso
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    //transformando o que foi recebido no input em double
    double dolar = double.parse(text);
    //transformando os controladores dos inputs em suas respectivas moedas:
    //apenas duas casas depois da vírgula no caso
    //no caso o this é para pegar a varável local e o dolar é a global:
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    //conversão de dolar para reais, depois para euro:
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    //transformando o que foi recebido no input em double
    double euro = double.parse(text);
    //transformando os controladores dos inputs em suas respectivas moedas:
    //apenas duas casas depois da vírgula no caso
    //no caso o this é para pegar a varável local e o euro é a global:
    realController.text = (euro * this.euro).toStringAsFixed(2);
    //conversão de euro para reais, depois para dolar:
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //AppBar:
      appBar: AppBar(
        //configurações AppBar:
        title: Text("\$ Conversor de Moedas \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      //implementando o future builder
      body: FutureBuilder<Map>(
        //precisamos passar o future que ele vai construir,
        //o future são as informações da API
        future: getData(),
        //vai construir a tela dependendo do que tem no getData()
        //no build vai ter uma função anônima que vai receber dois parâmetros,
        // o context e o snapshot (fotografia mometânea dos dados)
        builder: (context, snapshot) {
          //o switch vai receber o status dessa requisição:
          switch (snapshot.connectionState) {
            //se não estiver conectado em nada:
            case ConnectionState.none:
            //se estiver esperando os dados
            case ConnectionState.waiting:
              //Center é um widget que centraliza outro widget
              //como este case está esperando uma conexão então
              //será mostrado um texto que exibirá "carregando dados"
              return Center(
                child:
                    //configurações do texto:
                    Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );

            //caso ele não esteja esperando, nem esteja parado,
            // entra no caso default
            default:
              //primeiro é verificado se houve algum erro
              // na hora de carregar os dados:
              if (snapshot.hasError) {
                return Center(
                  child:
                      //configurações do texto:
                      Text(
                    "Erro ao carregar dados!",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              //caso em que não há erro
              else {
                //aqui é como pegamos as informações do arquivo json
                // nós acessamos até acharmos o filho que queremos da árvore
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                //tela rolante > coluna (ícone, input1,)
                return SingleChildScrollView(
                  //espaço entre widgets(padding)
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    //alinhando coluna no centro
                    //Divider é um divisor de campos (inputs)
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                      //campo Reais (input Reais)
                      buildTextField(
                          "Real", "R\$ ", realController, _realChanged),
                      Divider(),
                      //campo Dolar (input Dolar)
                      buildTextField(
                          "Dólar", "US\$ ", dolarController, _dolarChanged),
                      Divider(),
                      //campo Euro (input Euro)
                      buildTextField("Euro", "? ", euroController, _euroChanged)
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

//para otimizar o código faremos uma  função que cria textfields
//a função receberá por parâmetro o labelText ,prefixText, controlador textField, função:

Widget buildTextField(String label, String prefix,
    TextEditingController controlador, Function(String) func) {
  return TextField(
    //configurações do input:
    controller: controlador,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber, fontSize: 25.0),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: func,
    keyboardType: TextInputType.number,
  );
}
