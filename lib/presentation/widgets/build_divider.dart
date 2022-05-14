import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  final double endIndent;
  const BuildDivider({required this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MColors.yellow,
      height: 30,
      thickness: 2,
      endIndent: endIndent,
    );
  }
}
