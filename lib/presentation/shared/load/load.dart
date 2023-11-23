import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [CircularProgressIndicator.adaptive(), Text('Carregando...')],
      ),
    );
  }
}
