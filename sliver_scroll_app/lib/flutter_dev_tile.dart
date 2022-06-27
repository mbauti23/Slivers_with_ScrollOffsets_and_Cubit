import 'package:flutter/material.dart';

class BrFlutterDev {
  BrFlutterDev(this.id, this.name, this.isEmployed);

  final int id;
  final String name;
  final bool isEmployed;

  BrFlutterDev fire() {
    return BrFlutterDev(id, name, false);
  }

  BrFlutterDev reHire() {
    return BrFlutterDev(id, name, true);
  }
}

List<BrFlutterDev> listOfFlutterDevs() {
  return [
    BrFlutterDev(0, 'Martin', true),
    BrFlutterDev(1, 'Eric', true),
    BrFlutterDev(2, 'Zach', true),
    BrFlutterDev(3, 'Jason', true),
    BrFlutterDev(4, 'Shawn', true),
    BrFlutterDev(5, 'Andrew', true),
  ];
}

class FlutterDevTile extends StatelessWidget {
  const FlutterDevTile(this.dev, this.animVal, {Key? key}) : super(key: key);

  final Animation<double> animVal;
  final BrFlutterDev dev;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: animVal,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            key: ValueKey(dev.id),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dev.name),
                  Text(dev.isEmployed ? 'Employed' : 'Not Employed')
                ]),
          ),
        ));
  }
}
