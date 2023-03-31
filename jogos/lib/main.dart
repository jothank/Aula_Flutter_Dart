import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  ));
}

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  var _userWin = 0;
  var _computerWin = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
    }

    //Validação do ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Você ganhou";
        _userWin += 1;
      });
    } else if ((escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu";
        _computerWin += 1;
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos";
        _empate += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Sua Jogada",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SuaJogada(),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Jogada do Computador",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          JogadaComputadorRandom(),
          TextoResultadoJogada(),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Resultado",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Resultado()
        ],
      ),
    );
  }

  Row SuaJogada() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => _opcaoSelecionada("pedra"),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/pedra.png",
                height: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => _opcaoSelecionada("papel"),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/papel.png",
                height: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => _opcaoSelecionada("tesoura"),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/tesoura.png",
                height: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ClipOval JogadaComputadorRandom() {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Image(
        image: this._imagemApp,
        height: 100,
      ),
    );
  }

  Padding TextoResultadoJogada() {
    return Padding(
      padding: EdgeInsets.only(top: 32, bottom: 16),
      child: Text(this._mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Row Resultado() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                "Você",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "$_userWin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Empate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "$_empate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Computador",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "$_computerWin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
