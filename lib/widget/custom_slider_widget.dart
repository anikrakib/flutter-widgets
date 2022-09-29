import 'package:custom_slider/custom_slider.dart';
import 'package:flutter/material.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({Key? key}) : super(key: key);

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  double _value = 0.0;

  void _setValue(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Slider"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Slider Using Package',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomSlider(
              assetImage: 'assets/slider_thumb_image.png',
              inActiveTrackColor: Color(0xFF5AE4A7),
              linearGradient: LinearGradient(
                  colors: [Color(0xFF5AE4A7), Color(0xFF5AE4A7)]),
              trackHeight: 9,
              max: 100.0,
              min: 0.0,
              assetImageHeight: 21,
              assetImageWidth: 21,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Slider Using Custom Shape',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: Color(0xFF5AE4A7),
                inactiveTrackColor: Color(0xFF5AE4A7),
                trackHeight: 9,
                thumbShape: SliderThumbShape(disabledThumbRadius: 0),
              ),
              child: Slider(
                onChanged: _setValue,
                value: _value,
                max: 100,
                min: 0,
              ),
            ),
          ),
          Text(
            _value.toString(),
          ),
        ],
      ),
    );
  }
}

class SliderThumbShape extends SliderComponentShape {
  /// Create a slider thumb that draws a circle.

  const SliderThumbShape({
    this.enabledThumbRadius = 9.0,
    required this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  final double enabledThumbRadius;

  final double disabledThumbRadius;

  double get _disabledThumbRadius => disabledThumbRadius;

  final double elevation;

  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    required Animation<double> enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);
    assert(!sizeWithOverflow!.isEmpty);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );

    final double radius = radiusTween.evaluate(enableAnimation);

    {
      Paint paintStroke = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
      paintStroke.color = const Color(0xff313131).withOpacity(1.0);
      canvas.drawCircle(
        center,
        radius,
        paintStroke,
      );
      Paint paintFillCircle = Paint()..style = PaintingStyle.fill;
      paintFillCircle.color = const Color(0xffD4F7E5).withOpacity(1.0);
      canvas.drawCircle(
        center,
        radius,
        paintFillCircle,
      );
    }
  }
}
