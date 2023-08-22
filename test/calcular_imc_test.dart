import 'package:calcular_imc/calcular_imc.dart' as app;
import 'package:test/test.dart';

void main() {
  test(
      'Validando metódo calcular IMC passando nome vazio, deve retornar um erro',
      () {
    expect(() => app.calcularImc("", 65, 1.70),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Validando metódo calcular IMC', () {
    expect(app.calcularImc("William", 65, 1.65), equals(19.7));
  });

  group('Grupo de teste da tabela IMC, retorna o resultado', () {
    var valuesToTest = {
      {'imc': 15}: 'Magreza grave',
      {'imc': 16.5}: 'Magreza moderada',
      {'imc': 18}: 'Magreza leve',
      {'imc': 19}: 'Saudável',
      {'imc': 29}: 'Sobrepeso',
      {'imc': 32}: 'Obesidade grau I',
      {'imc': 36}: 'Obesidade grau II (severa)',
      {'imc': 41}: 'Obesidade grau III (mórbida)',
    };
    valuesToTest.forEach((chaves, valor) {
      test('Entrada: $chaves Esperado: $valor', () {
        expect(
            app.tabelaImc(double.parse(
              chaves['imc'].toString(),
            )),
            equals(valor));
      });
    });
  });

  test('Testando metódo da tabela IMC', () {
    expect(app.tabelaImc(19), equals('Saudável'));
  });
}
