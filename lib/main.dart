import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/ui/layout.dart';
import 'package:harveu/src/core/tile_map_editor.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TileMapEditor(),
      child: const TileEditorApp(),
    ),
  );
}

class TileEditorApp extends StatelessWidget {
  const TileEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harveu - Tile Map Editor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(
        body: LayoutEditor(),
      ),
    );
  }
}
