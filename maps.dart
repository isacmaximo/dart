//maps (são como uma tabela)
//são formados por uma chave e por um valor
//por exemplo a cahave pode ser nome e o valor isac

void main() {
//exemplo de um Map de DDD
//criando uma map (tabela) vazio
  Map<int, String> ddd = Map();
  //chave   //valor da chave
  ddd[85] = "Fortaleza";
  ddd[11] = "São Paulo";
  ddd[19] = "Campinas";

  //podemos ver as chaves desse Map:
  print(ddd.keys);
  //podemos ver os valores dessas respectivas chaves:
  print(ddd.values);
  //para exebir a relação completa das chaves com o valores:
  print(ddd);
  //podemos ter valores do tipo dynamic
  Map<String, dynamic> pessoa = Map();
  //chave          //valor da chave (vai ser dynamic)
  pessoa["nome"] = "Isac";
  pessoa["idade"] = 21;
  pessoa["altura"] = 1.67;
}
