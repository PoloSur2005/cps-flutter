import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int clickcontador = 0;
  int taps = 0;
  String clic = "CPS";
  num velocidad = 0;
  String vel = "";
  double tim = 0.2;
  String contador = "";
  late Timer _timer;
  bool primerClick = false;

  @override
  void initState() {
    super.initState();
  }

  void iniciarTimer() {
    if (!primerClick) {
      primerClick = true;

      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        setState(() {
          velocidad = taps.toDouble() / tim;
          tim = tim + 0.1;
          vel = velocidad.toStringAsFixed(2);
          contador = tim.toStringAsFixed(1);
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancelar el temporizador para reiniciar el contador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickcontador = 0;
          taps = 0;
          tim = 0.2;
          primerClick = false;
          if (_timer.isActive) {
            _timer.cancel(); // Cancelar el temporizador si está activo
          }
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      backgroundColor: Colors.black,
      body: InkWell(
        onTap: () {
          iniciarTimer();
          setState(() {
            clickcontador++;
            taps++;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickcontador',
                style:
                    const TextStyle(fontSize: 140, fontWeight: FontWeight.w100)
                        .merge(const TextStyle(color: Colors.white)),
              ),
              Text(
                "$clic $vel",
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue, // Puedes cambiar el color de fondo según tu diseño
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            contador,
            style: const TextStyle(
                color: Colors
                    .white), // Puedes cambiar el color del texto según tu diseño
          ),
        ),
      ),
    );
  }
}
