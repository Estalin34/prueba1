import 'package:flutter/material.dart';

class Ejercicio01 extends StatefulWidget {
  const Ejercicio01({super.key});

  @override
  _Ejercicio01State createState() => _Ejercicio01State();
}

class _Ejercicio01State extends State<Ejercicio01> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = "";

  void calcularIMC() {
    final peso = double.tryParse(_pesoController.text);
    final altura = double.tryParse(_alturaController.text);

    // Imprimir los valores para verificar
    print('Peso: $peso, Altura: $altura');  // Imprime los valores ingresados en consola

    // Verificar si peso y altura son válidos
    if (peso == null || altura == null || peso <= 0 || altura <= 0) {
      setState(() {
        _resultado = "Por favor, introduce valores válidos para peso y altura.";
      });
      return;
    }

    final imc = peso / (altura * altura);
    String interpretacion;

    if (imc < 18.5) {
      interpretacion = "Bajo peso";
    } else if (imc >= 18.5 && imc <= 24.9) {
      interpretacion = "Peso normal";
    } else if (imc >= 25.0 && imc <= 29.9) {
      interpretacion = "Sobrepeso";
    } else {
      interpretacion = "Obesidad";
    }

    setState(() {
      _resultado = "IMC: ${imc.toStringAsFixed(2)}\n$interpretacion";
    });

    // Limpiar los campos después de calcular
    _pesoController.clear();
    _alturaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de IMC")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/46/Lockheed_Martin_F-22A_Raptor_JSOH.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pesoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _alturaController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Altura (m)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularIMC,
                child: const Text("Calcular IMC"),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _resultado,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
