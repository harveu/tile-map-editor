import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class TileSelector extends StatelessWidget {
  const TileSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TileMapEditor>(
      builder: (context, editor, _) => Positioned(
        left: editor.selection[0] * editor.tileSize,
        top: editor.selection[1] * editor.tileSize,
        child: Container(
          width: editor.tileSize,
          height: editor.tileSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.purple,
              width: 3,
              strokeAlign: StrokeAlign.outside,
            ),
          ),
        ),
      ),
    );
  }
}
