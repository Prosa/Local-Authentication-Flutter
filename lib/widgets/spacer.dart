import 'package:flutter/material.dart';
import 'package:test_pin/constants/view_constants.dart';

class HorizontalSpacer extends StatelessWidget {
  final double viewSpace;

  const HorizontalSpacer({Key? key, this.viewSpace = ViewConstants.spaceBetweenHorizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: viewSpace,
    );
  }
}

class VerticalSpacer extends StatelessWidget {

  final double viewSpace;

  const VerticalSpacer({Key? key, this.viewSpace = ViewConstants.spaceBetweenVertical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: viewSpace,
    );
  }
}

