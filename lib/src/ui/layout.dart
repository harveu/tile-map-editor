import 'package:flutter/material.dart';

import 'package:harveu/src/core/canvas.dart';
import 'package:harveu/src/core/tile_map_editor.dart';
import 'package:harveu/src/ui/layers.dart';
import 'package:harveu/src/ui/tiles.dart';
import 'package:harveu/src/ui/topbar.dart';

class LayoutEditor extends StatelessWidget {
  const LayoutEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Topbar(),
        Expanded(
          child: Row(
            children: [
              const Tiles(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30.0 * TileMapEditor().tileSize,
                      height: 20.0 * TileMapEditor().tileSize,
                      margin: const EdgeInsets.only(
                        top: 15.0,
                        left: 15.0,
                        right: 15.0,
                      ),
                      color: Colors.grey.shade200,
                      child: const TileMapCanvas(),
                    ),
                    Layers(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
