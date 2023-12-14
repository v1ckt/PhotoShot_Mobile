import 'package:flutter/material.dart';

class ScrollableFilter extends StatefulWidget {
  final int? itemsCount;
  final List<dynamic>? items;
  final bool? isWide;
  const ScrollableFilter(
      {Key? key, int? itemsCount, List<dynamic>? items, bool? isWide})
      : itemsCount = items != null ? items.length : itemsCount ?? 0,
        items = items ?? const ['erro'],
        isWide = isWide ?? false,
        super(key: key);

  @override
  _ScrollableFilterState createState() => _ScrollableFilterState();
}

class _ScrollableFilterState extends State<ScrollableFilter> {
  int selectedIndex = 0;
  dynamic scrollto;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool hasWidget = widget.items!.any((item) => item is Widget);
    int itemWidth = hasWidget ? 70 : 100;
    return Container(
      height: hasWidget ? 35 : 25,
      width: widget.itemsCount! * itemWidth.toDouble(),
      child: Container(
        width: widget.itemsCount! * itemWidth.toDouble(),
        alignment: Alignment.center,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.itemsCount,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (widget.itemsCount! > 1) {
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
              }
              scrollController.animateTo(
                scrollto,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: hasWidget ? 70 : itemWidth.toDouble(),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color(0x33888888)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: widget.items![index] is String
                  ? Text(widget.items![index])
                  : widget.items![index],
            ),
          ),
        ),
      ),
    );
  }
}
