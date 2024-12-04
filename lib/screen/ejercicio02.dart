import 'package:flutter/material.dart';

class Ejercicio02 extends StatefulWidget {
  const Ejercicio02({super.key});

  @override
  _Ejercicio02State createState() => _Ejercicio02State();
}

class _Ejercicio02State extends State<Ejercicio02> {
  final _velocidadController = TextEditingController();
  String _resultado = "";

  void calcularDistancia() {
    final velocidad = double.tryParse(_velocidadController.text);

    if (velocidad != null) {
      const tiempo = 100; 
      final distancia = velocidad * tiempo;

      setState(() {
        _resultado = "Distancia recorrida: ${distancia.toStringAsFixed(2)} metros.";
      });
    } else {
      setState(() {
        _resultado = "Por favor, introduce una velocidad válida.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 02: Calcular Distancia")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/4/46/Lockheed_Martin_F-22A_Raptor_JSOH.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            TextField(
              controller: _velocidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Velocidad (m/s)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularDistancia,
              child: const Text("Calcular Distancia"),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
