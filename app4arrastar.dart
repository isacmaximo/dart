//App Lista de Tarefas - Arrastar ítem  da lista para o lado

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
  //controlador para adicionar na lista
  //podemos acessar o texto do input através desse controlador
  final _toDoController = TextEditingController();

  //lista que vai armazenar as tarefas
  List _toDoList = [];

  //parte de ler os arquivos e colocar na lista
  @override
  //aqui é como o widget é iniciado
  void initState() {
    super.initState();

    //lendo os dados do arquivo:
    //utilizaremos o them após o readData para chamar outra função após acabar
    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  //função para adicionar ítens na lista
  //basicamente vai pegar o que está escrito no input e adicionar na lista
  void _addToDo() {
    //como queremos atualizar a lista utilizamos o setstate
    setState(() {
      //map: vai ser uma nova tarefa
      Map<String, dynamic> newToDo = Map();
      //título da tarefa: vai ser o que está no input
      newToDo["title"] = _toDoController.text;
      //após isso o campo fica em branco:
      _toDoController.text = "";
      //ao criar-mos a tarefa ela inicia como falso (desmarcado)
      newToDo["ok"] = false;
      //então adicionamos a essa lista o map[título][checkbox]:
      //ou seja adicionamos a essa lista uma nova tarefa
      _toDoList.add(newToDo);
      //após isso a lista é salva no arquivo
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

                    //para não aparecer o sublinhado no texto
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  child: Text("ADD"),
                  //ao pressionar o botão a função adicionar tarefa é acionado
                  onPressed: _addToDo,
                ),
              ],
            ),
          ),

          //lita de tarefas (ListView):
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  //quantidade de ítens da lista: lista.length:
                  itemCount: _toDoList.length,
                  //aqui vai ser criada uma função que recebe um contexto e um índice:
                  //a função build ítem vai ser a lista de tarefas
                  itemBuilder: buildItem)),
        ],
      ),
    );
  }

  //criaremos uma função para uma melhor organização do widget da lista de tarefas:
  Widget buildItem(context, index) {
    //lista de checkbox
    //colocaremos a CheckboxListTile dentro de um Dismissible,
    //pois vai permitir arrastar as tarefas
    return Dismissible(
      //precisa de uma key, que no caso tem que ser diferente
      //as keys vão ser os milisegundos
      //vai pegar esses milisegundos e vai transformar em uma string
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      //precisamos especificar um background que vai ser um container
      background: Container(
        //para aparecer o fundo vermelho e o ícone lixeira quando arrastar:
        color: Colors.red,
        child: Align(
          //alinhamento da lixeira para ficar na esquerda:
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      //definido a direção do arraste (no caso da esquerda para direita)
      direction: DismissDirection.startToEnd,
      //aqui é o que ele deve arrastar:
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        //ícone circular
        secondary: CircleAvatar(
          //a condição vao ícone vai depender se está ok ou não
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
        ),
        //aqui é verificado se ocorreu alguma mudança:
        onChanged: (check) {
          //atualizar tela:
          setState(() {
            //check vai ser true ou false e vai ser armazenado em ok
            _toDoList[index]["ok"] = check;
            //para atualizar os dados do arquivo salvo,
            // (saber se estão marcados como true ou false)
            //salvamos o estado de salvo ou não
            _saveData();
          });
        },
      ),
    );
  }

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
