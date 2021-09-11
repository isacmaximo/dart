//Conversor de Moedas - Configurações iniciais da home

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
    //home
    //esse código vai servir para aprender a recuperar os dados do servidor.
    home: Home(),
  ));
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
    );
  }
}
