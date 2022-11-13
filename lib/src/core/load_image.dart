import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

abstract class LoadImage {
  static Future<ui.Image> load(String tileset) async {
    final ByteData data = await rootBundle.load('lib/assets/tilesets/$tileset');

    return await _loadImage(Uint8List.view(data.buffer));
  }

  static Future<ui.Image> _loadImage(Uint8List imageBuffer) async {
    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(imageBuffer, (ui.Image image) {
      return completer.complete(image);
    });

    return completer.future;
  }
}
