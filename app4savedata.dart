//App Lista de Tarefas - Salvando dados permanentemente no arquivo (json)

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
  //controlador para adicionar na lista
  //podemos acessar o texto do input atrav�s desse controlador
  final _toDoController = TextEditingController();

  //lista que vai armazenar as tarefas
  List _toDoList = [];

  //parte de ler os arquivos e colocar na lista
  @override
  //aqui � como o widget � iniciado
  void initState() {
    super.initState();

    //lendo os dados do arquivo:
    //utilizaremos o them ap�s o readData para chamar outra fun��o ap�s acabar
    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  //fun��o para adicionar �tens na lista
  //basicamente vai pegar o que est� escrito no input e adicionar na lista
  void _addToDo() {
    //como queremos atualizar a lista utilizamos o setstate
    setState(() {
      //map: vai ser uma nova tarefa
      Map<String, dynamic> newToDo = Map();
      //t�tulo da tarefa: vai ser o que est� no input
      newToDo["title"] = _toDoController.text;
      //ap�s isso o campo fica em branco:
      _toDoController.text = "";
      //ao criar-mos a tarefa ela inicia como falso (desmarcado)
      newToDo["ok"] = false;
      //ent�o adicionamos a essa lista o map[t�tulo][checkbox]:
      //ou seja adicionamos a essa lista uma nova tarefa
      _toDoList.add(newToDo);
      //ap�s isso a lista � salva no arquivo
      _saveData();
    });
  }

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
                    //controlador:
                    controller: _toDoController,
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
                  //ao pressionar o bot�o a fun��o adicionar tarefa � acionado
                  onPressed: _addToDo,
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
                    //aqui � verificado se ocorreu alguma mudan�a:
                    onChanged: (check) {
                      //atualizar tela:
                      setState(() {
                        //check vai ser true ou false e vai ser armazenado em ok
                        _toDoList[index]["ok"] = check;
                        //para atualizar os dados do arquivo salvo,
                        // (saber se est�o marcados como true ou false)
                        //salvamos o estado de salvo ou n�o
                        _saveData();
                      });
                    },
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
