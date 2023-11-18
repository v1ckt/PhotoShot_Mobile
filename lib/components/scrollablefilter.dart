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
            scrollController.animateTo(
              selectedIndex * itemWidth - MediaQuery.of(context).size.width / 2 + itemWidth / 2,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? const Color(0x33888888)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(widget.items![index]),
          ),
        ),
      ),
    );
  }
}