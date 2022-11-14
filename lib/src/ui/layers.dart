import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class Layers extends StatelessWidget {
  const Layers({super.key});

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
                onPressed: () =>
                    Provider.of<TileMapEditor>(context, listen: false)
                        .setLayer(0),
                child: const Text('Bottom Layer'),
              ),
              const SizedBox(width: 15.0),
              ElevatedButton(
                onPressed: () =>
                    Provider.of<TileMapEditor>(context, listen: false)
                        .setLayer(1),
                child: const Text('Middle Layer'),
              ),
              const SizedBox(width: 15.0),
              ElevatedButton(
                onPressed: () =>
                    Provider.of<TileMapEditor>(context, listen: false)
                        .setLayer(2),
                child: const Text('Top Layer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
