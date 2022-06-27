import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SectionTile extends StatelessWidget {
  const SectionTile(this.sectionName, {Key? key}) : super(key: key);

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            color: Color.fromARGB(255, 232, 235, 237),
            child: Text(
              sectionName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue),
            )),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class CollapsingList {
  sliverList() {
    return <Widget>[
      SectionTile('XD'),
      SliverGrid.count(
        crossAxisCount: 3,
        children: [
          borderedContainer(null, 150.0, Colors.red),
          borderedContainer(
            null,
            150.0,
            Colors.purple,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.green,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.orange,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.yellow,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.pink,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.cyan,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.indigo,
          ),
          borderedContainer(
            null,
            150.0,
            Colors.blue,
          ),
        ],
      ),
      SectionTile('Developers'),
      SliverFixedExtentList(
        itemExtent: 150.0,
        delegate: SliverChildListDelegate(
          [
            borderedContainer(null, null, Colors.red),
            borderedContainer(null, null, Colors.purple),
            borderedContainer(null, null, Colors.green),
            borderedContainer(null, null, Colors.orange),
            borderedContainer(null, null, Colors.yellow),
          ],
        ),
      ),
      SectionTile('QA'),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return borderedContainer(
              Text('grid item $index'),
              null,
              Colors.teal[100 * (index % 9)],
            );
          },
          childCount: 20,
        ),
      ),
      SectionTile('Other'),
      // Yes, this could also be a SliverFixedExtentList. Writing
      // this way just for an example of SliverList construction.
      SliverList(
        delegate: SliverChildListDelegate(
          [
            borderedContainer(null, 150, Colors.pink),
            borderedContainer(null, 150, Colors.cyan),
            borderedContainer(null, 150, Colors.indigo),
            borderedContainer(null, 150, Colors.blue),
          ],
        ),
      ),
    ];
  }

  borderedContainer(
    Widget? child,
    double? height,
    Color? color,
  ) {
    var rng = Random();
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color ?? Colors.white, width: 5)),
      height: height,
      child: child ??
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Image(
              image: NetworkImage(
                  'https://picsum.photos/seed/${rng.nextInt(1000)}/200/200'),
              width: 200,
              height: 200,
            ),
          ),
    );
  }
}
