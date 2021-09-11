//clase maior
class Animal {
  String nome;
  double peso;

  //formato
  Animal(this.nome, this.peso);

//a��o 1 da classe animal
  void comer() {
    print('$nome comeu!'); //nome do animal + comeu
  }

//a��o 2 da classe animal
  void fazerSom() {
    print('$nome fez algum som!');
  }
}

//criando uma classe cachorro que herda as caracter�sticas do animal
class Cachorro extends Animal {
  //atributo novo
  int felicidade;
  //formato da super classe (herdada)
  //o super tem que ser colocado para receber os valores da classe animal
  Cachorro(String nome, double peso, this.felicidade) : super(nome, peso);

  //a��o 1 da classe cachorro
  void brincar() {
    felicidade += 10;
    print('A  felicidade de $nome aumentou, e agora � : $felicidade');
  }
}

//criando uma classe gato que tamb�m herda as caracter�sticas de animal
class Gato extends Animal {
  //vai continuar com as carcter�sticas normais de animal sem adicionar
  //formato da classe herdada
  Gato(String nome, double peso) : super(nome, peso);

  //a��o 1 da classe animal
  bool Amigavel() {
    return true;
  }
}

void main() {
  //acessando fun��es de cada classe

  //exemplo com a classe cachorro:
  //� dado um nome e � atribuido sua formata��o
  Cachorro cachorroUm = Cachorro("Toby", 30.0, 90);
  //acessando suas fun��es/a��es; (podem ser de animal e de cachorro)
  cachorroUm.fazerSom();
  cachorroUm.comer();
  cachorroUm.brincar();

  //exemplo com a classe gato:
  //� dado um nome e � atribuido sua formata��o
  Gato gatoUm = Gato("Mally", 15.0);
  //acessando suas fun��es/a��es; (podem ser de animal e de gato)
  gatoUm.fazerSom();
  gatoUm.comer();
  gatoUm.Amigavel();
  print("est� amig�vel? ${gatoUm.Amigavel()}");
}
