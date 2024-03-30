## Lógica
### Contador
```dart
void iniciarTimer() {
  if (!primerClick) {//comprueba que sea el primer click para iniciar el contador
    primerClick = true;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {//la velocidad en base a los eventos sobre el tiempo
        velocidad = taps.toDouble() / tim;
        tim = tim + 0.1;//variable que almacena el tiempo
        vel = velocidad.toStringAsFixed(2);//cortando string para no mostrar decimales
        contador = tim.toStringAsFixed(1);
      });
    });
  }
}
```
Decidí hacer el ciclo cada 0.1 segundos para que la actualización de la velocidad sea más fluida y la medición sea más exacta; sin embargo, esto puede cambiarse según las necesidades de uso.

###Boton
```dart
floatingActionButton: FloatingActionButton(
  onPressed: () {
    clickcontador = 0;//regresando las variables a su estado inicial
    taps = 0;
    tim = 1;
    primerClick = false;
    if (_timer.isActive) {
      _timer.cancel(); // Cancelar el temporizador si está activo
    }
    setState(() {});
  },
  child: const Icon(Icons.refresh),
)

```
Lo importante de esta parte es inicializar el tiempo en uno debido a que si lo dejamos en cero en el primer click la función devolverá un "infinity" debido a la operación: 1/0; de esta manera evitamos este error.
###Consideraciones finales
Las librerías utilizadas para el proyecto son:
```bash
import 'dart:async';
import 'package:flutter/material.dart';
```
Espero que esto te sirva y estoy abierto a recomendaciones o sugerencias.
