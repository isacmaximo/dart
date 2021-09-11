//Conversor de Moedas

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
import 'package:async/async.dart';
//library para transformar os dados em json:
import 'dart:convert';

//aqui colocaremos a url, como � uma constante ent�o podemos usar const.
const request = "https://api.hgbrasil.com/finance?format=json&key=cb5fa7da";

//fun��o principal
//colocamos async pois vamos utilizar coisas ass�ncronas (dados da API)
void main() async {
  //fazendo uma requisi��o ass�ncrona:
  //primeiro fazemos algo que pega essas informa��es da API:
  //colocamos await para esperar essas informa��es
  http.Response response = await http.get(Uri.parse(request));

  //print da resposta no formato json:
  print(response.body);

  //condi��es iniciais para criar o app:
  runApp(MaterialApp(
    //home
    //esse c�digo vai servir para aprender a recuperar os dados do servidor.
    home: Container(),
  ));
}
