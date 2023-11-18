import 'package:flutter/material.dart';

class ScrollableFilter extends StatefulWidget {
  final int? itemsCount;
  final List<String>? items;
  const ScrollableFilter({Key? key, int? itemsCount, List<String>? items})
      : itemsCount = itemsCount ?? 1,
        items = items ?? const ['erro'],
        super(key: key);

  @override
  _ScrollableFilterState createState() => _ScrollableFilterState();
}

class _ScrollableFilterState extends State<ScrollableFilter> {
  int selectedIndex = 0;
  dynamic scrollto;
  final itemWidth = 100;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemsCount,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (selectedIndex <= 1) {
              scrollto = 0.0;
            } else if (selectedIndex == widget.itemsCount! - 2) {
              scrollto = (widget.itemsCount! * itemWidth).toDouble();
            } else {
              scrollto = (selectedIndex * itemWidth -
                      MediaQuery.of(context).size.width / 2.1 +
                      itemWidth / 2)
                  .toDouble();
            }

            scrollController.animateTo(
              scrollto,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: itemWidth.toDouble(),
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? const Color(0x33888888)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(widget.items![index]),
          ),
        ),
      ),
    );
  }
}
