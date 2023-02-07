import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/strings.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_staff_member.dart';

class MemberCard extends Card {
  final BuildContext context;
  final UiStaffMember member;
  const MemberCard(
    this.context, {
    super.key,
    required this.member,
  });

  @override
  Widget? get child => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            member.image ??
                (MediaQuery.platformBrightnessOf(context) == Brightness.light
                    ? '${Strings.logoImagesPath}/logo_noir.PNG'
                    : '${Strings.logoImagesPath}/logo_blanc.png'),
            fit: BoxFit.cover,
            height: Dimensions.screen(context).height * 0.2,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Colors.black26, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AutoSizeText(
              member.name,
              style: Font.m(
                  color: Theme.of(context).colorScheme.primary, bold: true),
            ),
          ),
        ],
      );

  @override
  double? get elevation => 1;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.black12),
      );
}
