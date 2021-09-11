//utilizando reescrita de métodos

//clase maior
class Animal {
  String nome;
  double peso;

  //formato
  Animal(this.nome, this.peso);

//ação 1 da classe animal
  void comer() {
    print('$nome comeu!'); //nome do animal + comeu
  }

//ação 2 da classe animal
  void fazerSom() {
    print('$nome fez algum som!');
  }
}

//criando uma classe cachorro que herda as características do animal
class Cachorro extends Animal {
  //atributo novo
  int felicidade;
  //formato da super classe (herdada)
  //o super tem que ser colocado para receber os valores da classe animal
  Cachorro(String nome, double peso, this.felicidade) : super(nome, peso);

  //ação 1 da classe cachorro
  void brincar() {
    felicidade += 10;
    print('A  felicidade de $nome aumentou, e agora é : $felicidade');
  }

  //utiliamos o @override para reescrita de métodos
  //por exemplo vou alterar o fazer som que é herdado de animal e agora mudará para outro formato desejado
  @override
  //aqui colocamos no mesmo formato da função herdada
  void fazerSom() {
    //aqui ocorre a mudança
    print('$nome fez au au!');
  }

  //podemos mostrar os atributos do cachorro  com a função toString, por exemplo:
  @override
  String toString() {
    return "Cachorro | Nome: $nome, Peso: $peso, Feelicidade: $felicidade";
  }
}

//criando uma classe gato que também herda as características de animal
class Gato extends Animal {
  //vai continuar com as carcterísticas normais de animal sem adicionar
  //formato da classe herdada
  Gato(String nome, double peso) : super(nome, peso);

  //ação 1 da classe animal
  bool Amigavel() {
    return true;
  }

  //utiliamos o @override para reescrita de métodos
  //por exemplo vou alterar o fazer som que é herdado de animal e agora mudará para outro formato desejado
  @override
  //aqui colocamos no mesmo formato da função herdada
  void fazerSom() {
    //aqui ocorre a mudança
    print('$nome fez miau!');
  }

  //podemos mostrar os atributos do gato com a função toString, por exemplo:
  @override
  String toString() {
    return "Gato | Nome: $nome, Peso: $peso";
  }
}

void main() {
  //acessando funções de cada classe

  //exemplo com a classe cachorro:
  //é dado um nome e é atribuido sua formatação
  Cachorro cachorroUm = Cachorro("Toby", 30.0, 90);
  //acessando suas funções/ações; (podem ser de animal e de cachorro)
  cachorroUm.fazerSom();
  cachorroUm.comer();
  cachorroUm.brincar();
  //aqui mostrará os atributos de cachorro:
  print(cachorroUm);

  //exemplo com a classe gato:
  //é dado um nome e é atribuido sua formatação
  Gato gatoUm = Gato("Mally", 15.0);
  //acessando suas funções/ações; (podem ser de animal e de gato)
  gatoUm.fazerSom();
  gatoUm.comer();
  gatoUm.Amigavel();
  print("está amigável? ${gatoUm.Amigavel()}");
  //aqui mostrará os atributos do gato:
  print(gatoUm);
}
