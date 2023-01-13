import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/common/web_view.dart';

class SubscriptionButton extends GestureDetector {
  final BuildContext context;
  final String label;
  final String? url;

  SubscriptionButton(this.context, {super.key, required this.label, this.url});

  @override
  GestureTapCallback? get onTap =>
      () => url != null ? WebView(url!).showInternet() : null;

  @override
  Widget? get child => Container(
        decoration: BoxDecoration(
          color: url != null ? Colors.black54 : Colors.black38,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(marginXXS(context).width),
        child: AutoSizeText(
          label,
          style: TextXS(url != null ? Colors.white : Colors.white60),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}

class FeedbackButton extends ListTile {
  final String label;
  final String url;
  final String? date;

  const FeedbackButton({
    super.key,
    required this.label,
    required this.url,
    this.date,
  });

  @override
  GestureTapCallback? get onTap => () => WebView(url).showInternet();

  @override
  Widget? get title => Text(label,
      style: const TextStyle(color: Colors.white), textAlign: TextAlign.center);

  @override
  Widget? get subtitle => date != null
      ? Text(date!,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center)
      : null;

  @override
  Color? get tileColor => Colors.black54;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black87),
      );
}
