class Pessoa {
  String _nome = "";
  final List<double> _peso = [];
  final List<double> _altura = [];

  Pessoa(String nome) {
    _nome = nome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  List<double> getPeso() {
    return _peso;
  }

  List<double> getAltura() {
    return _altura;
  }

  void adicionarPesoAltura(double peso, double altura) {
    _peso.add(peso);
    _altura.add(altura);
  }

  double calcularMediaIMC() {
    double somaIMC = 0;
    int quantidade = _peso.length;

    for (int i = 0; i < quantidade; i++) {
      double imc = _peso[i] / (_altura[i] * _altura[i]);
      somaIMC += imc;
    }

    double mediaIMC = somaIMC / quantidade;
    return mediaIMC.isNaN ? 0 : mediaIMC;
  }

   String classificarIMC() {
    double mediaIMC = calcularMediaIMC();
    if (mediaIMC < 16) {
      return "Magreza grave";
    } else if (mediaIMC < 17) {
      return "Magreza moderada";
    } else if (mediaIMC < 18.5) {
      return "Magreza leve";
    } else if (mediaIMC < 25) {
      return "Saudável";
    } else if (mediaIMC < 30) {
      return "Sobrepeso";
    } else if (mediaIMC < 35) {
      return "Obesidade grau I";
    } else if (mediaIMC < 40) {
      return "Obesidade grau II (severa)";
    } else {
      return "Obesidade grau III (mórbida)";
    }
  }

  bool mediaImc(double classificacao) {
    return calcularMediaIMC() >= classificacao;
  }
}