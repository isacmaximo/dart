//App Lista de Tarefas - Interface parte 1

//importando libraries necessárias para criar o app
//necessárias para entrada e saída
//Material App
import 'dart:async';

import 'package:flutter/material.dart';
//auxilia na leitura de arquivos (JSON)
import 'package:path_provider/path_provider.dart';
// assíncronas
import 'package:async/async.dart';
import 'dart:io';
import 'dart:convert';

//função principal
void main() {
  //material App
  runApp(MaterialApp(
    //home vai ser stateful:
    home: Home(),
  ));
}

//widget stateful (Home)
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //lista que vai armazenar as tarefas
  final List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    //interface:
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),

      //Corpo do App
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova Tarefa",
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  child: Text("ADD"),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //lista que vai armazenar essas tarefas:

  //criando uma função que vai retornar o arquivo que eu vou utilizar para salvar
  //ou seja precisamos do Future:
  Future<File> _getFile() async {
    //função que vai pegar um diretório onde posso armazenar documentos do meu app
    final directory = await getApplicationDocumentsDirectory();
    //o retorno vai ser o caminho desse arquivo:
    return File("${directory.path}/data.json");
  }

  //função para salvar dados
  Future<File> _saveData() async {
    //transformar a lista em json
    String data = json.encode(_toDoList);
    //esperando o arquivo
    final file = await _getFile();
    //escrever os dados da lista de tarefas como texto
    return file.writeAsString(data);
  }

  //função que vai ler os arquivos
  Future<String> _readData() async {
    //utilizaremos o try catch: ou seja , vai tentar fazer alguma coisa
    //e se caso der errado vai exibir algum erro.
    try {
      final file = await _getFile();
      //tentar ler o arquivo como string
      return file.readAsString();
    } catch (e) {
      return null!;
    }
  }
}
