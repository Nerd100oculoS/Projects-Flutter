import 'package:calculator_basic/Components/Teclado.dart';
import 'package:calculator_basic/Components/Tela.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  final Processamento memory = Processamento();

  _pressBotao(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
        home: Column(
      children: [
        Display(memory.valor),
        Keybord(_pressBotao),
      ],
    ));
  }
}


class Processamento {
  String _valor = "0";
  static const operacoes = ["+", "-", "x", "/", "+/-", "%", "="];

  final _buffer = [0.0, 0.0];
  int _indexBuffer = 0;
  String _op = "";
  bool _clearValor = false;
  String _ultimoComando = "";

  _allClear() {
    _valor = "0";
    _buffer.setAll(0, [0.0, 0.0]);
    _indexBuffer = 0;
    _op = "";
    _clearValor = false;
  }

  void applyCommand(String command) {
    if (_confSubstOp(command)) {
      _op = command;
      return;
    }

    if (command == "AC") {
      _allClear();
    } else if (operacoes.contains(command)) {
      _setOperacoes(command);
    } else {
      _addDigito(command);
    }
    _ultimoComando = command;
  }

  _setOperacoes(String newOp) {
    bool caracIgual = newOp == "=";
    if (_indexBuffer == 0) {
      if (!caracIgual) {
        _op = newOp;
        _indexBuffer = 1;
        _clearValor = true;
      }
    } else {
      _buffer[0] = _Calculo();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith(".0") ? _valor.split(".")[0] : _valor;

      _op = caracIgual ? "" : newOp;
      _indexBuffer = caracIgual ? 0 : 1;
      _clearValor = !caracIgual;
    }
  }

  _addDigito(String digito) {
    final point = digito == ".";
    final valorVazio = point ? "0" : "";
    final clearValAux = (_valor == "0" && !point) || _clearValor;
    final atualValor = clearValAux ? valorVazio : _valor;

    _valor = atualValor + digito;
    _clearValor = false;

    if (point && _valor.contains(".") && !clearValAux) {
      return;
    }

    _buffer[_indexBuffer] = double.tryParse(_valor) ?? 0;
  }

  _Calculo() {
    switch (_op) {
      case "+/-":
        return (-1) * _buffer[0];
      case '%':
        return _buffer[0] / 100;
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  _confSubstOp(String command) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(command) &&
        _ultimoComando != '=' &&
        command != '=';
  }

  String get valor {
    return _valor;
  }
}