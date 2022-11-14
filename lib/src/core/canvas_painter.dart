import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class TilePainter extends CustomPainter {
  TilePainter({required this.image});

  ui.Image image;
  final Size tileSize = Size(
    TileMapEditor().tileSize,
    TileMapEditor().tileSize,
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (var layer in TileMapEditor().layers) {
      layer.forEach((key, value) {
        double positionX = double.parse(key.split('-')[0]);
        double positionY = double.parse(key.split('-')[1]);

        double tileX = value[0].toDouble();
        double tileY = value[1].toDouble();

        // TODO: Same size of tile
        Rect grab = Offset(tileX * 32, tileY * 32) & tileSize;
        Rect place = Offset(positionX * 32, positionY * 32) & tileSize;

        canvas.drawImageRect(
          image,
          grab,
          place,
          Paint(),
        );
      });
    }
  }

  @override
  bool shouldRepaint(TilePainter oldDelegate) => false;
}
