import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRulerPickerWidget extends StatefulWidget {
  const CustomRulerPickerWidget({Key? key}) : super(key: key);

  @override
  State<CustomRulerPickerWidget> createState() =>
      _CustomRulerPickerWidgetState();
}

class _CustomRulerPickerWidgetState extends State<CustomRulerPickerWidget> {
  RulerPickerController? _rulerPickerController;

  int currentValue = 50;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  Widget _buildBtn(int value) {
    return InkWell(
      onTap: () {
        _rulerPickerController?.value = value;
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: Colors.blue,
          child: Text(
            value.toString(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Ruler Picker"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentValue.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
            const SizedBox(height: 50),
            RulerPicker(
                controller: _rulerPickerController!,
                beginValue: 0,
                rulerScaleTextStyle: const TextStyle(color: Color(0xFF313131)),
                endValue: 100,
                rulerBackgroundColor: Colors.transparent,
                initValue: currentValue,
                scaleLineStyleList: const [
                  ScaleLineStyle(
                      color: Color(0xFF313131), width: 1.5, height: 30, scale: 0),
                  ScaleLineStyle(
                      color: Color(0xFF313131), width: 1.5, height: 25, scale: 5),
                  ScaleLineStyle(
                      color: Color(0xFF313131), width: 1.5, height: 15, scale: -1),
                ],
                onValueChange: (value) {
                  setState(() {
                    currentValue = value;
                  });
                },
                width: MediaQuery.of(context).size.width,
                height: 75,
                rulerMarginTop: 33,
                marker: SvgPicture.asset('assets/ruler_marker.svg')),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBtn(30),
                const SizedBox(width: 10),
                _buildBtn(50),
                const SizedBox(width: 10),
                _buildBtn(70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
