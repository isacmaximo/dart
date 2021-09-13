//Conversor de Moedas - Interface (Textfiels e Input)

//usaremos uma API (ponte para pegar informa��es) para pegar os dados
//precisamos incluir o pacote http no arquivo pubspec.yaml
//colocaremos abaixo de cupertino_icons (tem que ser alinhado)

//library necess�ria para criar o app
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//library necess�ria para fazer a requisi��o http:
import 'package:http/http.dart' as http;

//library necess�ria para fazer requisi��o ass�ncrona, ou seja para que
//o app n�o pare para receber as informa��es, quando recebe faz alguma coisa,
import 'dart:async';

//library para transformar os dados em json:
import 'dart:convert';

//aqui colocaremos a url, como � uma constante ent�o podemos usar const.
const request = "https://api.hgbrasil.com/finance?format=json&key=cb5fa7da";

//fun��o principal
//colocamos async pois vamos utilizar coisas ass�ncronas (dados da API)
void main() async {
  //condi��es iniciais para criar o app:
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

//fun��o que ir� retornar um dado futuro:
//no caso vai ser um map
Future<Map> getData() async {
  //fazendo uma requisi��o ass�ncrona:
  //primeiro fazemos algo que pega essas informa��es da API:
  //colocamos await para esperar essas informa��es
  http.Response response = await http.get(Uri.parse(request));
  //aqui h� o retorno no formato json
  return json.decode(response.body);
}

//stateless
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //vari�veis que v�o receber os valores das moedas:
  //temos que declarar o late antes das vari�veis:
  late double dolar;
  late double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //AppBar:
      appBar: AppBar(
        //configura��es AppBar:
        title: Text("\$ Conversor de Moedas \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      //implementando o future builder
      body: FutureBuilder<Map>(
        //precisamos passar o future que ele vai construir,
        //o future s�o as informa��es da API
        future: getData(),
        //vai construir a tela dependendo do que tem no getData()
        //no build vai ter uma fun��o an�nima que vai receber dois par�metros,
        // o context e o snapshot (fotografia momet�nea dos dados)
        builder: (context, snapshot) {
          //o switch vai receber o status dessa requisi��o:
          switch (snapshot.connectionState) {
            //se n�o estiver conectado em nada:
            case ConnectionState.none:
            //se estiver esperando os dados
            case ConnectionState.waiting:
              //Center � um widget que centraliza outro widget
              //como este case est� esperando uma conex�o ent�o
              //ser� mostrado um texto que exibir� "carregando dados"
              return Center(
                child:
                    //configura��es do texto:
                    Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );

            //caso ele n�o esteja esperando, nem esteja parado,
            // entra no caso default
            default:
              //primeiro � verificado se houve algum erro
              // na hora de carregar os dados:
              if (snapshot.hasError) {
                return Center(
                  child:
                      //configura��es do texto:
                      Text(
                    "Erro ao carregar dados!",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              //caso em que n�o h� erro
              else {
                //aqui � como pegamos as informa��es do arquivo json
                // n�s acessamos at� acharmos o filho que queremos da �rvore
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                //tela rolante > coluna (�cone, input1,)
                return SingleChildScrollView(
                  //espa�o entre widgets(padding)
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    //alinhando coluna no centro
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                      //campo Reais (input Reais)
                      TextField(
                        //configura��es do input:
                        decoration: InputDecoration(
                          labelText: "Real",
                          labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 25.0),
                          border: OutlineInputBorder(),
                          prefixText: "R\$ ",
                        ),
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      ),
                      Divider(),
                      //campo Dolar (input Dolar)
                      TextField(
                        //configura��es do input:
                        decoration: InputDecoration(
                          labelText: "Dolar",
                          labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 25.0),
                          border: OutlineInputBorder(),
                          prefixText: "US\$ ",
                        ),
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      ),
                      Divider(),
                      //campo Euro (input Euro)
                      TextField(
                        //configura��es do input:
                        decoration: InputDecoration(
                          labelText: "Euro",
                          labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 25.0),
                          border: OutlineInputBorder(),
                          prefixText: "? ",
                        ),
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      ),
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
