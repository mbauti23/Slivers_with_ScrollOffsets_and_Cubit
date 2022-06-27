import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_scroll_app/cubit/scroll_cubit.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
    required this.appColor,
  }) : super(key: key);

  final Color appColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubit, ScrollState>(
      buildWhen: (previous, current) =>
          previous.isAppBarCollapsed != current.isAppBarCollapsed,
      builder: (context, state) {
        return IconButton(
            onPressed: () {},
            icon: Icon(Icons.help_outline,
                color: state.isAppBarCollapsed ? appColor : Colors.white,
                size: 25));
      },
    );
  }
}
