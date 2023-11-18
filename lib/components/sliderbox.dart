import 'package:flutter/material.dart ';
import 'package:photoshot/components/slider.dart';

class SliderBox extends StatelessWidget {
  final int stage, bsize;
  final String title;
  const SliderBox({
    Key? key,
    required this.stage,
    required this.title,
    int? bsize,
  })  : bsize = bsize ?? 1000,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                stage.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ItemSlider(stage: stage, size: bsize)
        ],
      ),
    );
  }
}
