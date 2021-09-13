//App Lista de Tarefas - L�gica inicial da lista com checkbox

//importando libraries necess�rias para criar o app
//necess�rias para entrada e sa�da
//Material App
import 'dart:async';

import 'package:flutter/material.dart';
//auxilia na leitura de arquivos (JSON)
import 'package:path_provider/path_provider.dart';
// ass�ncronas
import 'package:async/async.dart';
import 'dart:io';
import 'dart:convert';

//fun��o principal
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
  final List _toDoList = ["Item 1", "Item 2"];

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
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),

                    //para n�o aparecer o sublinhado no texto
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  child: Text("ADD"),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          //lita de tarefas (ListView):
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                //quantidade de �tens da lista: lista.length:
                itemCount: _toDoList.length,
                //aqui vai ser criada uma fun��o que recebe um contexto e um �ndice:
                itemBuilder: (context, index) {
                  //lista de checkbox
                  return CheckboxListTile(
                    title: Text(_toDoList[index]["title"]),
                    value: _toDoList[index]["ok"],
                    //�cone circular
                    secondary: CircleAvatar(
                      //a condi��o vao �cone vai depender se est� ok ou n�o
                      child: Icon(
                          _toDoList[index]["ok"] ? Icons.check : Icons.error),
                    ),
                    onChanged: (bool? value) {},
                  );
                }),
          ),
        ],
      ),
    );
  }

  //lista que vai armazenar essas tarefas:

  //criando uma fun��o que vai retornar o arquivo que eu vou utilizar para salvar
  //ou seja precisamos do Future:
  Future<File> _getFile() async {
    //fun��o que vai pegar um diret�rio onde posso armazenar documentos do meu app
    final directory = await getApplicationDocumentsDirectory();
    //o retorno vai ser o caminho desse arquivo:
    return File("${directory.path}/data.json");
  }

  //fun��o para salvar dados
  Future<File> _saveData() async {
    //transformar a lista em json
    String data = json.encode(_toDoList);
    //esperando o arquivo
    final file = await _getFile();
    //escrever os dados da lista de tarefas como texto
    return file.writeAsString(data);
  }

  //fun��o que vai ler os arquivos
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
