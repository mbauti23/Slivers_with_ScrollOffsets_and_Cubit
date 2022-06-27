import 'package:flutter/material.dart';
import 'dart:math' as math;

class PartnerImage extends StatelessWidget {
  const PartnerImage(
    this.appColor,
    this.offset, {
    Key? key,
  }) : super(key: key);

  final Color appColor;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: math.max(10 - (offset / 20), 0)),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: appColor.withOpacity(math.max(1 - (offset / 100), 0)),
                blurRadius: 20,
                spreadRadius: 6)
          ]),
      constraints: BoxConstraints(
          maxHeight: 300 + (offset / 2), maxWidth: 300 + (offset / 2)),
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        'assets/images/partner.png',
      ),
    );
  }
}
