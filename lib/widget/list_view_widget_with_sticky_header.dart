import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:palette_generator/palette_generator.dart';

class ListViewWidgetWithStickyHeader extends StatelessWidget {
  const ListViewWidgetWithStickyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 100,
            itemBuilder: (context, index) => StickyHeaderBuilder(
              overlapHeaders: true,
              builder: (context, stuckAmount) {
                stuckAmount = 1 - stuckAmount.clamp(0, 1);
                return Container(
                  width: double.infinity,
                  height: 60,
                  color: Color.lerp(Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4), Colors.purple.shade700, stuckAmount),
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Sticky Header #${(index + 1)}',
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                );
              },
              content: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
          ),
        ),
      );
}

// Calculate dominant color from ImageProvider
Future<Color> getImagePalette (ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator
      .fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor!.color;
}