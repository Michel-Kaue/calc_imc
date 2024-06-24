import 'dart:io';

import 'package:calc_imc/exception/nome_invalido_exception.dart';
import 'package:calc_imc/models/pessoa.dart';
import 'package:calc_imc/models/console_utils.dart';

void execute() {
  print("Calculadora IMC");
  String nome = ConsoleUtils.lerStringComTexto("Digite seu nome:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }
    var pessoa = Pessoa(nome);
    double? peso;
    do {
      peso = ConsoleUtils.lerDoubleComTextoComSaida("Digite o peso ou S para sair", "S");
      if (peso != null) {
        double altura = ConsoleUtils.lerDoubleComTextoComSaida("Digite a altura:", "S")!;
        pessoa.adicionarPesoAltura(peso, altura);
      }
    } while (peso != null);
    print("Nome: ${pessoa.getNome()}");
    print("Média do IMCs: ${pessoa.calcularMediaIMC()}");
    print("Classificação do IMC: ${pessoa.classificarIMC()}");
}

void main() {
  execute();
}