import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/colours.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class MyButton extends GestureDetector {
  final BuildContext context;
  final String label;
  final VoidCallback function;

  MyButton(this.context,
      {super.key, required this.label, required this.function});

  @override
  GestureTapCallback? get onTap => () => function;

  @override
  Widget? get child => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(marginXXS(context).width),
        child: AutoSizeText(
          label.toUpperCase(),
          style: const TextXS(Colours.primary),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
