import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final ContainerSize size;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.size = ContainerSize.medium,
    this.alignment = Alignment.topCenter,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.maxWidth),
        child: Padding(
          padding: padding ?? AppSpacings.edgeInsetsM,
          child: child,
        ),
      ),
    );
  }
}
