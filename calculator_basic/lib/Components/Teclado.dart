import 'package:calculator_basic/Components/Botoes.dart';
import 'package:flutter/material.dart';

class Keybord extends StatelessWidget {
  final void Function(String) callB;

  Keybord(this.callB);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      color: Colors.black,
      child: Column(
        children: [
          LinhaDeBotoes([
            Botao(
              number: "AC",
              corBotao: Color(0xFF5D4037),
              callB: callB,
            ),
            Botao.operation(number: "+/-", callB: callB),
            Botao.operation(number: "%", callB: callB),
            Botao.operation(number: "/", callB: callB)
          ]),
          LinhaDeBotoes([
            Botao(number: "7", callB: callB),
            Botao(number: "8", callB: callB),
            Botao(number: "9", callB: callB),
            Botao.operation(number: "x", callB: callB),
          ]),
          LinhaDeBotoes([
            Botao(number: "4", callB: callB),
            Botao(number: "5", callB: callB),
            Botao(number: "6", callB: callB),
            Botao.operation(number: "-", callB: callB),
          ]),
          LinhaDeBotoes([
            Botao(number: "1", callB: callB),
            Botao(number: "2", callB: callB),
            Botao(number: "3", callB: callB),
            Botao.operation(number: "+", callB: callB),
          ]),
          LinhaDeBotoes([
            Botao(number: "0", callB: callB),
            Botao(number: ".", callB: callB),
            Botao(number: "00", callB: callB),
            Botao.operation(number: "=", callB: callB),
          ]),
        ],
      ),
    );
  }
}
