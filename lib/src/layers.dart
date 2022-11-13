import 'package:flutter/material.dart';

class Layers extends StatelessWidget {
  final void Function(int layer) setLayer;

  const Layers({super.key, required this.setLayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Editing layer:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setLayer(0),
                child: const Text('Bottom Layer'),
              ),
              const SizedBox(width: 15.0),
              ElevatedButton(
                onPressed: () => setLayer(1),
                child: const Text('Middle Layer'),
              ),
              const SizedBox(width: 15.0),
              ElevatedButton(
                onPressed: () => setLayer(2),
                child: const Text('Top Layer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
