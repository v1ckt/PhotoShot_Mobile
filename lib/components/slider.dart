import 'package:flutter/material.dart';

class ItemSlider extends StatefulWidget {
  final int stage, size;
  const ItemSlider({
    Key? key,
    required this.stage,
    int? size,
  })  : size = size ?? 1000,
        super(key: key);

  @override
  _ItemSliderState createState() => _ItemSliderState();
}

class _ItemSliderState extends State<ItemSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 16,
          child: Container(
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.98, -0.18),
                end: Alignment(-0.98, 0.18),
                colors: [Color(0xFF0400A6), Color(0xFFC000A0)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.transparent,
            inactiveTrackColor: Colors.transparent,
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 0,
            thumbColor: Colors.white,
            valueIndicatorColor: Colors.transparent,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.black,
            ),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
            overlayColor: Colors.transparent,
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Slider(
            value: widget.stage.toDouble(),
            min: -100,
            max: 100,
            label: widget.stage.toString(),
            onChanged: (double value) {},
          ),
        ),
      ],
    );
  }
}
