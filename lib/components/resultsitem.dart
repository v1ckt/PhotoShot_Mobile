import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ResultList extends StatelessWidget {
  final List<String>? imgList;
  const ResultList({Key? key, this.imgList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: imgList!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgList![index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
    );
  }
}
