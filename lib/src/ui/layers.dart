import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class Layers extends StatelessWidget {
  Layers({super.key});

  final ButtonStyle style = ElevatedButton.styleFrom(
    backgroundColor: Colors.purple.shade200,
  );

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
          Consumer<TileMapEditor>(
            builder: (context, editor, _) => Row(
              children: [
                ElevatedButton(
                  style: editor.currentLayer == 0 ? style : null,
                  onPressed: () => editor.setLayer(0),
                  child: const Text('Bottom Layer'),
                ),
                const SizedBox(width: 15.0),
                ElevatedButton(
                  style: editor.currentLayer == 1 ? style : null,
                  onPressed: () => editor.setLayer(1),
                  child: const Text('Middle Layer'),
                ),
                const SizedBox(width: 15.0),
                ElevatedButton(
                  style: editor.currentLayer == 2 ? style : null,
                  onPressed: () => editor.setLayer(2),
                  child: const Text('Top Layer'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
