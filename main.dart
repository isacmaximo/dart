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

  //exemplo com a classe gato:
  //é dado um nome e é atribuido sua formatação
  Gato gatoUm = Gato("Mally", 15.0);
  //acessando suas funções/ações; (podem ser de animal e de gato)
  gatoUm.fazerSom();
  gatoUm.comer();
  gatoUm.Amigavel();
  print("está amigável? ${gatoUm.Amigavel()}");
}
