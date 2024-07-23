import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class Pan1 extends StatelessWidget {
  const Pan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outside (360°)"),
      ),
      body: Center(
        child: Panorama(
          child: Image.asset("lib/assets/pan1.jpg"),
        ),
      ),
    );
  }
}

class Pan2 extends StatelessWidget {
  const Pan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room 1 (360°)"),
      ),
      body: Center(
        child: Panorama(
          child: Image.asset("lib/assets/pan2.jpg"),
        ),
      ),
    );
  }
}

class Pan3 extends StatelessWidget {
  const Pan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room 2 (360°)"),
      ),
      body: Center(
        child: Panorama(
          child: Image.asset("lib/assets/pan5.jpg"),
        ),
      ),
    );
  }
}
