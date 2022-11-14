import 'package:flutter/material.dart';

import 'package:harveu/src/core/canvas.dart';
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
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 15.0,
                          left: 15.0,
                          right: 15.0,
                        ),
                        color: Colors.grey.shade200,
                        child: const TileMapCanvas(),
                      ),
                    ),
                    const Layers(),
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
