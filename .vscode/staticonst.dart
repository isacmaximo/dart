//classe onde eu quero apenas armazenar as constantes
//sem necessidade de instanciar objetos

class Valores {
  //aqui podemos colocar um static antes da variável
  //permitindo o acesso sem instanciar o objeto
  static int vezesClicado;
}

//criado uma class pessoa
class Pessoa {}

void main() {
//podemos aceassar vezesClicado com o formato: NomedaClasse.variavel
  Valores.vezesClicado = 2;

  //podemos declarar uma constante com const, e essa constante permanece com valor inalterado,
  //não poodendo atribruir outros valores. Exemplo:
  const num = 5;

//podemos também preservar os valores de uma criação de classe
//por exemplo, quando queremos que os dados de uma determinada pessoa não deve ser alterado
//utilizamos final antes da classe. Exemplo abaixo:
  final Pessoa pessoaUm = Pessoa();
  //o final vai assegurar que os dados não vão ser alterados;
}
