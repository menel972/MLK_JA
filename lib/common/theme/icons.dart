import 'package:flutter/material.dart';
import 'package:mlk_ja/common/size.dart';

class AfterInfoIcon extends Container {
  final BuildContext context;
  final bool isRounded;
  final IconData icon;

  AfterInfoIcon(
    this.context, {
    super.key,
    this.isRounded = false,
    required this.icon,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        border: Border.all(
          width: 1,
          color:
              isRounded ? Theme.of(context).colorScheme.primary : Colors.black,
        ),
        borderRadius: BorderRadius.circular(isRounded ? 100 : 10),
        color: isRounded ? Colors.transparent : Colors.grey.withOpacity(0.4),
      );

  @override
  EdgeInsetsGeometry? get padding => EdgeInsets.all(marginXXS(context).width);

  @override
  Widget? get child => Icon(
        icon,
        color: isRounded ? Theme.of(context).colorScheme.primary : Colors.black,
      );
}
