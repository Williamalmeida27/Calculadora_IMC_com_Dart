import 'dart:io';

import 'package:calcular_imc/classes/exception_custom/excecao_custom.dart';
import 'package:calcular_imc/classes/ultils.dart';

execute() {
  print("Calculadora IMC");
  var nome = Utils.lerTexto("Informe seu nome: ");
  var peso = Utils.inputConvert("Informe seu peso: ");
  var altura = Utils.inputConvert("Informe sua altura em cm: ");
  try {
    if (nome.trim() == "") {
      throw ExcecaoCustom().nomeinvalidoException();
    }
    if (peso! <= 0 || altura! <= 0) {
      throw ExcecaoCustom().pesoOuAlturainvalidoException();
    }
  } catch (e) {
    print(e);
    exit(0);
  }

  print(tabelaImc(calcularImc(nome, peso, altura)));
}

double calcularImc(String nome, double peso, double altura) {
  var imcCalculado = peso / (altura * 2);
  String imcCalculadoDecimal = imcCalculado.toStringAsFixed(2);
  return double.parse(imcCalculadoDecimal);
}

String tabelaImc(double imc) {
  var tabelaImc = '';

  switch (imc) {
    case < 16:
      tabelaImc = "Magreza grave";
      break;
    case >= 16 && < 17:
      tabelaImc = "Magreza moderada";
      break;
    case >= 17 && < 18.5:
      tabelaImc = "Magreza leve";
      break;
    case >= 18.5 && < 25:
      tabelaImc = "Saudável";
      break;
    case >= 25 && < 30:
      tabelaImc = "Sobrepeso";
      break;
    case >= 30 && < 35:
      tabelaImc = "Obesidade grau I";
      break;
    case >= 35 && < 40:
      tabelaImc = "Obesidade grau II (severa)";
      break;
    case >= 40:
      tabelaImc = "Obesidade grau III (mórbida)";
      break;
    default:
      print("Nenhum valor retornado");
  }
  return tabelaImc;
}
