import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.appColor,
    this.isCollapsed = false,
  })  : slideProgress = null,
        _slides = false,
        super(key: key);

  const TitleWidget.thatSlides({
    Key? key,
    this.slideProgress = 0,
    required this.appColor,
    this.isCollapsed = false,
  })  : _slides = true,
        super(key: key);

  final Color appColor;
  final double? slideProgress;
  final bool isCollapsed;
  final bool _slides;

  @override
  Widget build(BuildContext context) {
    //if normal
    if (!_slides) {
      return title(isCollapsed, _slides);
    }
    return AlignTransition(
        alignment: Tween<AlignmentGeometry>(
          begin: Alignment.bottomLeft,
          end: Alignment(
              Alignment.bottomCenter.x - .01, Alignment.bottomCenter.y),
        ).animate(AlwaysStoppedAnimation<double>(slideProgress!)),
        child: title(isCollapsed, _slides));
  }

  Widget title(bool isCollapsed, bool isSliding) {
    return AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
            left: isCollapsed
                ? isSliding
                    ? 5.0
                    : 15.0
                : 5.0),
        child: Text('The Team',
            style: TextStyle(
                color: isCollapsed ? appColor : Colors.white,
                fontWeight:
                    isCollapsed ? FontWeight.normal : FontWeight.w200)));
  }
}
