//App Lista de Tarefas - Ordenar tarefas feitas ou n�o

//importando libraries necess�rias para criar o app
//necess�rias para entrada e sa�da
//Material App
import 'dart:async';
import 'dart:ffi';

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

  //fazendo o sistema de desfazer (SnackBar):
  //primeiro temos que criar um map do mesmo tipo que entra da lista:
  late Map<String, dynamic> _lastRemoved;
  //posi��o do �ltimo �tem removido
  late int _lastRemovedPos;

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

  //fun��o que vai dar o refresh:
  Future<Void> _refresh() async {
    setState(() {
      //esperar um segundo
      Future.delayed(Duration(seconds: 1));
      //fun��o que vai ordenar os �tens da lista:
      //os n�o conclu�dos v�o estar acima dos conclu�dos
      _toDoList.sort((a, b) {
        //se a estiver marcado e b desmarcado:
        if (a["ok"] && !b["ok"]) {
          return 1;
        }
        //se a estiver desmarcado e b estiver marcado:
        else if (!a["ok"] && b["ok"]) {
          return -1;
        }
        //se os dois s�o iguais:
        else {
          return 0;
        }
      });
      _saveData();
    });
    return null!;
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
            //para dar um refresh na lista;
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  //quantidade de �tens da lista: lista.length:
                  itemCount: _toDoList.length,
                  //aqui vai ser criada uma fun��o que recebe um contexto e um �ndice:
                  //a fun��o build �tem vai ser a lista de tarefas
                  itemBuilder: buildItem),
            ),
          ),
        ],
      ),
    );
  }

  //criaremos uma fun��o para uma melhor organiza��o do widget da lista de tarefas:
  Widget buildItem(context, index) {
    //lista de checkbox
    //colocaremos a CheckboxListTile dentro de um Dismissible,
    //pois vai permitir arrastar as tarefas
    return Dismissible(
      //precisa de uma key, que no caso tem que ser diferente
      //as keys v�o ser os milisegundos
      //vai pegar esses milisegundos e vai transformar em uma string
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      //precisamos especificar um background que vai ser um container
      background: Container(
        //para aparecer o fundo vermelho e o �cone lixeira quando arrastar:
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
      //definido a dire��o do arraste (no caso da esquerda para direita)
      direction: DismissDirection.startToEnd,
      //aqui � o que ele deve arrastar:
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        //�cone circular
        secondary: CircleAvatar(
          //a condi��o vao �cone vai depender se est� ok ou n�o
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
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
      ),

      //fun��o para fazer alguma a��o ao arrastar um �tem para a direita
      //vai  receber como par�metro a dire��o para onde o �tem foi arrastado:
      onDismissed: (direction) {
        //para atualizar a lista:
        setState(() {
          //primeiro vamos duplicar:
          _lastRemoved = Map.from(_toDoList[index]);
          //aqui vai guardar a posi��o do �tem arrastado:
          _lastRemovedPos = index;
          //aqui remover� o �tem da lista:
          _toDoList.removeAt(index);
          //salvar a lista j� com o �tem removido:
          _saveData();

          //aqui vamos criar o SnackBar (geralmente � utilizado para exibir alguma informa��o)
          //neste caso vamos utilizar tamb�m para aparecer a  a��o de desfazer:
          final snack = SnackBar(
            //content � o conte�do desse SnackBar
            //vai aparecer a �ltima tarefa["t�tulo da tarefa"] removida:
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida"),
            //definindo uma a��o para o SnackBar
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                //vamos inserir a tarefa que foi duplicada (ultima tarefa arrastada)
                //�ltima posi��o inserida e o map daquela posi��o:
                setState(() {
                  _toDoList.insert(_lastRemovedPos, _lastRemoved);
                  _saveData();
                });
              },
            ),
            //definindo a dura��o que o SnackBar (desfazer) aparece:
            duration: Duration(seconds: 2),
          );
          //para mostar a SnackBar usamos o Scaffold
          ScaffoldMessenger.of(context).showSnackBar(snack);
        });
      },
    );
  }

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
