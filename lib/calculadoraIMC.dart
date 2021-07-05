import 'dart:math';

class CalculadoraIMC {
  double altura;
  double peso;
  int idade;

  CalculadoraIMC(double altura, double peso, int idade) {
    this.altura = altura;
    this.peso = peso;
    this.idade = idade;
  }

  double calcular() {
    var resultado = peso / pow(altura, 2);
    return resultado;
  }

  String classificar() {
    var imc = calcular();
    var resultado = 'IMC: ' + imc.toStringAsPrecision(4) + '\n';

    if (idade < 60 && imc < 16) {
      resultado += 'Magreza grave';
    }
    else if (idade < 60 && imc >= 16 && imc < 17) {
      resultado += 'Magreza moderada';
    }
    else if (idade < 60 && imc >= 17 && imc < 18.5) {
      resultado += 'Magreza leve';
    }
    else if (idade < 60 && imc >= 18.5 && imc < 25) {
      resultado += 'Saudável';
    }
    else if (idade < 60 && imc >= 25 && imc < 30) {
      resultado += 'Obesidade Grau 1';
    }
    else if (idade < 60 && imc >= 30 && imc < 35) {
      resultado += 'Obesidade Grau 2 (considerada severa)';
    }
    else if (idade < 60 && imc >= 35 && imc < 40) {
      resultado += 'Obesidade Grau 3 (considerada mórbida)';
    }

    if (idade >= 60 && imc < 21.9) {
      resultado += 'Subnutrido ou abaixo do peso';
    }
    else if (idade >= 60 && imc >= 22 && imc < 27) {
      resultado += 'Peso ideal';
    }
    else if (idade >= 60 && imc >= 27.1 && imc < 30) {
      resultado += 'Levemente acima do peso';
    }
    else if (idade >= 60 && imc >= 30.1 && imc < 35) {
      resultado += 'Primeiro grau de obesidade';
    }
    else if (idade >= 60 && imc >= 35.1 && imc < 39.9) {
      resultado += 'Segundo grau de obesidade';
    }
    else if (idade >= 60 && imc >= 40) {
      resultado += 'Obesidade mórbida';
    }

    return resultado; 
  } 
}

