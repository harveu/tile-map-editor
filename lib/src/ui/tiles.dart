import 'package:flutter/material.dart';
import 'package:harveu/src/ui/tile_selector.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class Tiles extends StatelessWidget {
  const Tiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: double.infinity,
      margin: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        bottom: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Tiles',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: GestureDetector(
              onTapDown: Provider.of<TileMapEditor>(context).getTile,
              child: Stack(
                children: [
                  Image.asset(
                    'lib/assets/tilesets/${TileMapEditor().tileset}',
                    alignment: Alignment.topLeft,
                  ),
                  const TileSelector(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
