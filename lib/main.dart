import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultado_imc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaFormulario(),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();

  void _calcularIMC() {
    final double peso = double.tryParse(_controllerPeso.text) ?? 0;
    final double altura = double.tryParse(_controllerAltura.text) ?? 0;
    if (peso > 0 && altura > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoIMC(
            peso: peso,
            altura: altura,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerPeso,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerAltura,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: _calcularIMC,
                child: const Text('Calcular'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
