import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:harveu/src/core/canvas_painter.dart';
import 'package:harveu/src/core/load_image.dart';
import 'package:harveu/src/core/tile_map_editor.dart';
import 'package:provider/provider.dart';

class TileMapCanvas extends StatefulWidget {
  const TileMapCanvas({super.key});

  @override
  State<TileMapCanvas> createState() => _TileMapCanvasState();
}

class _TileMapCanvasState extends State<TileMapCanvas> {
  late ui.Image image;
  bool isImageLoaded = false;

  _init() async {
    image = await LoadImage.load(TileMapEditor().tileset);

    setState(() {
      isImageLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    if (!isImageLoaded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onPanUpdate: Provider.of<TileMapEditor>(context).addTile,
      child: Consumer<TileMapEditor>(
        builder: (context, editor, _) => CustomPaint(
          painter: TilePainter(image: image, editor: editor),
        ),
      ),
    );
  }
}
