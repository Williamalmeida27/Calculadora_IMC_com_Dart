class ExcecaoCustom implements Exception {
  String nomeinvalidoException() {
    return "Nome inválido";
  }

  String pesoOuAlturainvalidoException() {
    return "O valor do peso/altura não pode ser zero";
  }
}
