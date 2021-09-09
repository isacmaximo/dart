//criando listas

//usaremso essa class
class Pessoas {
  String nome;
  int idade;

  Pessoas(this.nome, this.idade);
}

void main() {
//para criar uma lista, precisamos saber do tipo da lista
//formato da lista em dart : List<tipo> nomelista = [dado1, dado2, dado etc];
//exemplo com um lista de nomes

  List<String> nomes = ["Isac", "Julia", "Marcos", "Gabriela"];

  //aqui printa todos os nomes só que com os colchetes
  print(nomes);

  //por exemplo podemos acessar os nomes de uma determinada posição, pois são indexados:
  //aqui será acessado o primeiro ítem da lista por exemplo
  print(nomes[0]);

  //podemos adcionar ítens/ dados a essa lista com o .add, esse adcionar vai para o final da lista
  //formato de adcionar:  nomelista.add(dado);
  //exemplo:
  nomes.add("Thiago");
  print("Agora com a lista atualizada: $nomes");

  //podemos ver o tamanho dessa lista com .length
  //formato do tamanhoi de lista: nomelista.length

  int tamLista = nomes.length;
  print("Tamanho da lista: $tamLista");

  //podemos remover um ídem da lista de uma determinada posição
  //formato da remoção: nomelista.removeAt(posiçãoItem);
  //por exemplo vou remover o Thiago da lista:
  nomes.removeAt(4);
  //Agora com a remoção a lista fica assim:
  print(nomes);

  //vamos realocar Thiago novamente na lista, só que em  uma posição diferente:
  //podemos adcionar em uma posição específica com o .insert
  //exemplo:
  nomes.insert(2, "Thiago");
  //agora foi inserido na posição 3, que na linguagem é 2
  print(nomes);

  //podemos verificar se tem algum ítem nessa lista
  //por Exemplo vou verificar se tem o nome Marcos na lista
  //utilizamos o formato: nomelista.contains(dado);
  print(nomes.contains("Marcos"));

}
