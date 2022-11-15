import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/ui/layout.dart';
import 'package:harveu/src/core/tile_map_editor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    await DesktopWindow.setWindowSize(const Size(1344, 900));
    await DesktopWindow.setMinWindowSize(const Size(1344, 900));
    await DesktopWindow.setMaxWindowSize(Size.infinite);
  }

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
