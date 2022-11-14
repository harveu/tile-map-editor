import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harveu/src/core/tile_map_editor.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Tile Map Editor',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Provider.of<TileMapEditor>(context, listen: false)
                .clearCanvas(),
            child: const Text('Clear Canvas'),
          ),
          const SizedBox(width: 15.0),
          ElevatedButton(
            onPressed: () =>
                Provider.of<TileMapEditor>(context, listen: false).exportMap(),
            child: const Text('Export Map Image'),
          ),
        ],
      ),
    );
  }
}
