import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String number;
  final Color corBotao;
  final void Function(String) callB;

  static const OPERACAO = Color(0xFF6D4C41);
  static const DEFAULT = Color(0xFF616161);

  Botao({required this.number, this.corBotao = DEFAULT, required this.callB});

  Botao.operation(
      {required this.number, this.corBotao = OPERACAO, required this.callB});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: RaisedButton(
        color: this.corBotao,
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: () => callB(number),
      ),
    );
  }
}


class LinhaDeBotoes extends StatelessWidget {
  final List<Botao> botoes;

  LinhaDeBotoes(this.botoes);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes,
      ),
    );
  }
}
