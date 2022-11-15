import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class TilePainter extends CustomPainter {
  TilePainter({
    required this.image,
    required this.editor,
  });

  ui.Image image;
  TileMapEditor editor;

  @override
  void paint(Canvas canvas, Size size) {
    for (var layer in editor.layers) {
      layer.forEach((key, value) {
        double positionX = double.parse(key.split('-')[0]);
        double positionY = double.parse(key.split('-')[1]);

        double tileX = value[0].toDouble();
        double tileY = value[1].toDouble();

        Rect grab = Offset(
              tileX * editor.tileSize,
              tileY * editor.tileSize,
            ) &
            Size(
              editor.tileSize,
              editor.tileSize,
            );
        Rect place = Offset(
              positionX * editor.tileSize,
              positionY * editor.tileSize,
            ) &
            Size(
              editor.tileSize,
              editor.tileSize,
            );

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
  bool shouldRepaint(TilePainter oldDelegate) => true;
}
