import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:harveu/src/ui/loader.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/canvas_painter.dart';
import 'package:harveu/src/core/load_image.dart';
import 'package:harveu/src/core/tile_map_editor.dart';

class TileMapCanvas extends StatefulWidget {
  const TileMapCanvas({super.key});

  @override
  State<TileMapCanvas> createState() => _TileMapCanvasState();
}

class _TileMapCanvasState extends State<TileMapCanvas> {
  late ui.Image image;
  bool isImageLoaded = false;
  final FocusNode _focusNode = FocusNode();

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
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isImageLoaded) {
      return const Loader();
    }

    return Focus(
      onKey: Provider.of<TileMapEditor>(context, listen: false).handleKeyEvent,
      focusNode: _focusNode,
      child: MouseRegion(
        onExit: (event) {
          Provider.of<TileMapEditor>(context, listen: false).setInCanvas(false);
          FocusScope.of(context).unfocus();
        },
        onEnter: (event) {
          Provider.of<TileMapEditor>(context, listen: false).setInCanvas(true);
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Listener(
          onPointerMove: Provider.of<TileMapEditor>(context).addTile,
          child: Consumer<TileMapEditor>(
            builder: (context, editor, _) => CustomPaint(
              painter: TilePainter(image: image, editor: editor),
            ),
          ),
        ),
      ),
    );
  }
}
