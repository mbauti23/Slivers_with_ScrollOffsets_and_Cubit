import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_scroll_app/cubit/scroll_cubit.dart';
import 'package:sliver_scroll_app/main.dart';
import 'package:sliver_scroll_app/partner_image.dart';
import 'package:sliver_scroll_app/title_widget.dart';

class MainFlexibleSpaceBar extends StatelessWidget {
  const MainFlexibleSpaceBar({
    Key? key,
    required this.appColor,
  }) : super(key: key);

  final Color appColor;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      stretchModes: [
        StretchMode.fadeTitle,
      ],
      centerTitle: false,
      titlePadding: const EdgeInsets.only(bottom: 10),
      expandedTitleScale: 2.5,
      collapseMode: CollapseMode.pin,
      background: Stack(alignment: Alignment.center, children: [
        BlocBuilder<ScrollCubit, ScrollState>(
          buildWhen: (previous, current) =>
              (current.offset < 0 && previous.offset < 0),
          builder: (context, state) {
            return PartnerImage(appColor,
                (!context.read<Final>().app) ? 0 : state.offset.abs());
          },
        ),
        if (context.read<Final>().app)
          BlocBuilder<ScrollCubit, ScrollState>(
              builder: ((context, state) => Container(
                  color: Colors.black.withOpacity(state.progressToCollapse()))))
      ]),
      title: BlocBuilder<ScrollCubit, ScrollState>(
        builder: (context, state) {
          if (context.read<Final>().app) {
            return TitleWidget.thatSlides(
              appColor: appColor,
              isCollapsed: state.isAppBarCollapsed,
              slideProgress: state.progressToCollapse(),
            );
          }

          return TitleWidget(
            appColor: appColor,
            isCollapsed: state.isAppBarCollapsed,
          );
        },
      ),
    );
  }
}
