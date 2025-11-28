import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedContainerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  // Variables para controlar las propiedades
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation - Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer con propiedades animadas
            AnimatedContainer(
              // Propiedades animadas
              width: _isExpanded ? 300 : 150,
              height: _isExpanded ? 300 : 150,
              decoration: BoxDecoration(
                color: _isExpanded ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(
                  _isExpanded ? 50 : 10,
                ),
                border: Border.all(
                  color: _isExpanded ? Colors.red : Colors.orange,
                  width: _isExpanded ? 4 : 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isExpanded
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.green.withOpacity(0.3),
                    blurRadius: _isExpanded ? 20 : 5,
                    spreadRadius: _isExpanded ? 5 : 0,
                  ),
                ],
              ),
              // Duración de la animación
              duration: const Duration(milliseconds: 800),
              // Curva de animación
              curve: Curves.easeInOutCubic,
              // Widget hijo
              child: Center(
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _isExpanded ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                  child: Text(
                    _isExpanded ? 'Expandido' : 'Presiona',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Botón para disparar la animación
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: const Icon(Icons.animation),
              label: const Text('Animar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Información
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Las propiedades animadas incluyen:\n'
                '• Ancho y alto\n'
                '• Color de fondo\n'
                '• Radio del borde\n'
                '• Estilos de borde\n'
                '• Sombra\n'
                '• Tamaño de texto',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}