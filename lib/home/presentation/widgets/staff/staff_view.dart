import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_staff_member.dart';
import 'package:mlk_ja/home/presentation/widgets/staff/widgets/member_card.dart';

class StaffView extends StatelessWidget {
  const StaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: marginM(context).width,
        left: marginXXS(context).width,
        right: marginXXS(context).width,
      ),
      child: Column(
        children: [
          const AutoSizeText(
            'LE STAFF JEUNES ADULTES',
            style: TextL(isBold: true),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: marginXXS(context).width),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: screen(context).width * 0.01,
              childAspectRatio: 0.78,
              padding: EdgeInsets.symmetric(vertical: marginXS(context).width),
              children: [
                const UiStaffMember('Ménélick',
                    image: 'assets/images/staff/menelick.png'),
                const UiStaffMember('Thérésa',
                    image: 'assets/images/staff/theresa.png'),
                const UiStaffMember('Patrick'),
                const UiStaffMember('Alexis'),
                const UiStaffMember('Mélanie'),
                const UiStaffMember('Stéphanie'),
                const UiStaffMember('Stécie'),
                const UiStaffMember('Marly'),
                const UiStaffMember('Anne-Claire'),
                const UiStaffMember('Martha'),
                const UiStaffMember('Joy'),
                const UiStaffMember('Sarah'),
                const UiStaffMember('Ludhmilia'),
                const UiStaffMember('Sandra'),
              ].map((member) => MemberCard(context, member: member)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
