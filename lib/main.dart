import 'package:flutter/material.dart';

import 'package:harveu/src/layout.dart';

void main() => runApp(const TileEditorApp());

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
      home: Scaffold(
        body: LayoutEditor(),
      ),
    );
  }
}
