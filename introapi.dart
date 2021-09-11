//Conversor de Moedas

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
import 'package:async/async.dart';
//library para transformar os dados em json:
import 'dart:convert';

//aqui colocaremos a url, como é uma constante então podemos usar const.
const request = "https://api.hgbrasil.com/finance?format=json&key=cb5fa7da";

//função principal
//colocamos async pois vamos utilizar coisas assíncronas (dados da API)
void main() async {
  //fazendo uma requisição assíncrona:
  //primeiro fazemos algo que pega essas informações da API:
  //colocamos await para esperar essas informações
  http.Response response = await http.get(Uri.parse(request));

  //print da resposta no formato json:
  print(response.body);

  //condições iniciais para criar o app:
  runApp(MaterialApp(
    //home
    //esse código vai servir para aprender a recuperar os dados do servidor.
    home: Container(),
  ));
}
