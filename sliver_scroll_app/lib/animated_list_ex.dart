import 'package:flutter/material.dart';
import 'package:sliver_scroll_app/flutter_dev_tile.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({Key? key}) : super(key: key);

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAnimatedList(
            key: _listKey,
            itemBuilder: (context, index, animVal) {
              return FlutterDevTile(
                listOfFlutterDevs()[index],
                animVal,
              );
            }),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverGrid.count(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 3,
              children: [
                GestureDetector(
                    onTap: () {
                      // _listKey.currentState!
                      //     .insertItem(context.read<ListCubit>().nextDev);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Insert another dev"),
                    )),
                GestureDetector(
                    onTap: () {
                      _listKey.currentState!.removeItem(
                          2,
                          (_, val) => SizeTransition(
                                sizeFactor: val,
                              ),
                          duration: Duration(milliseconds: 300));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Delete a dev"),
                    )),
              ]),
        ),
      ],
    );
  }
}
