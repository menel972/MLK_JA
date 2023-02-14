import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/common/web_view.dart';

class SubscriptionButton extends GestureDetector {
  final BuildContext context;
  final String label;
  final String? url;

  SubscriptionButton(
    this.context, {
    super.key,
    this.label = 'S\'inscrire',
    this.url,
  });

  @override
  GestureTapCallback? get onTap =>
      () => url != null ? WebView(url!).showInternet() : null;

  @override
  Widget? get child => Container(
        decoration: BoxDecoration(
          color: url != null
              ? Theme.of(context).colorScheme.onSecondary
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(Dimensions.xxs(context).width),
        child: AutoSizeText(
          label,
          style: Font.xs(
            color: url != null
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}

class AfterInfoButton extends GestureDetector {
  final BuildContext context;
  final String label;
  final String? url;

  AfterInfoButton(
    this.context, {
    super.key,
    this.label = 'RÉSERVE TA PLACE',
    this.url,
  });

  @override
  GestureTapCallback? get onTap =>
      () => url != null ? WebView(url!).showInternet() : null;

  @override
  Widget? get child => Container(
        decoration: BoxDecoration(
          color: url != null
              ? Colors.black
              : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(Dimensions.xxs(context).height),
        margin: EdgeInsets.symmetric(vertical: Dimensions.xxs(context).height),
        child: AutoSizeText(
          label,
          style: Font.s(
            color: url != null ? Colors.white : Colors.white38,
            bold: true,
          ),
          textAlign: TextAlign.center,
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
    required this.label,
    required this.url,
    super.key,
    this.date,
  });

  @override
  GestureTapCallback? get onTap => () => WebView(url).showInternet();

  @override
  Widget? get title => AutoSizeText(
        label,
        style: Font.m(color: Colors.white),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 16,
      );

  @override
  Widget? get subtitle => date != null
      ? AutoSizeText(
          date!,
          style: Font.s(color: Colors.white70),
          textAlign: TextAlign.center,
          maxLines: 1,
          minFontSize: 12,
          overflow: TextOverflow.ellipsis,
        )
      : null;

  @override
  Color? get tileColor => Colors.black;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      );
}
