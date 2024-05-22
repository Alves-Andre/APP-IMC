import 'package:flutter/material.dart';

class ResultadoIMC extends StatefulWidget {
  final double peso;
  final double altura;

  ResultadoIMC({required this.peso, required this.altura});

  @override
  _ResultadoIMCState createState() => _ResultadoIMCState();
}

class _ResultadoIMCState extends State<ResultadoIMC> {
  @override
  Widget build(BuildContext context) {
    double imc = widget.peso / (widget.altura * widget.altura);
    String resultado;
    String urlImg;
    if (imc < 18.5) {
      resultado = "Magro demais";
      urlImg = "assets/imagens/magro.png";
    } else if (imc >= 18.5 && imc <= 24.9) {
      resultado = "Normal";
      urlImg = "assets/imagens/normal.png";
    } else {
      resultado = "Obeso";
      urlImg = "assets/imagens/obeso.png";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Seu IMC é ${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Classificação: $resultado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              urlImg,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
