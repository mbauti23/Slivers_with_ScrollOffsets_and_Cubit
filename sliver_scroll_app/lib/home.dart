import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_scroll_app/collapsing_list.dart';
import 'package:sliver_scroll_app/cubit/scroll_cubit.dart';
import 'package:sliver_scroll_app/help_button.dart';
import 'package:sliver_scroll_app/main.dart';
import 'dart:math' as math;

import 'package:sliver_scroll_app/main_flexible_space_bar.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  final double toolBarHeight = 50.0;
  final Color appColor = Colors.blue.shade600;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double appBarHeight = math.max(height / 2, toolBarHeight);
    //init scroll listener and cubit
    initScroll(appBarHeight);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverAppBar(
              stretch: true,
              toolbarHeight: toolBarHeight,
              collapsedHeight: toolBarHeight,
              automaticallyImplyLeading: false,
              expandedHeight: appBarHeight,
              titleSpacing: 0.0,
              pinned: true,
              backgroundColor: MaterialStateColor.resolveWith((states) {
                return (states.contains(MaterialState.scrolledUnder))
                    ? Colors.white
                    : Colors.black;
              }),
              actions: [
                HelpButton(appColor: appColor),
              ],
              flexibleSpace: Stack(children: [
                if (context.read<Final>().app)
                  FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Center(
                        child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: appColor.withOpacity(.2)),
                    )),
                  ),
                MainFlexibleSpaceBar(appColor: appColor)
              ]),
            ),
            if (context.read<Final>().app)
              SliverAppBar(
                toolbarHeight: 20,
                backgroundColor: appColor,
                collapsedHeight: 20,
                stretch: false,
                primary: false,
                pinned: false,
              ),
            ...CollapsingList().sliverList(),
            SliverToBoxAdapter(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(color: Colors.black, height: 100),
                Container(color: Colors.red, height: 100),
                Container(color: Colors.blue, height: 100),
                Container(color: Colors.red, height: 100),
                Container(color: Colors.black, height: 100),
              ],
            ))
          ]),
    );
  }

  void initScroll(double appBarHeight) {
    if (!scrollController.hasClients) {
      context.read<ScrollCubit>().initScroll(
            appBarHeight,
            toolBarHeight,
          );
      //if a listener was added before somehow
      scrollController.removeListener(scrollListener);
      scrollController.addListener(scrollListener);
    }
  }

  void scrollListener() {
    context.read<ScrollCubit>().updateOffset(
          scrollController.offset,
        );
  }
}
