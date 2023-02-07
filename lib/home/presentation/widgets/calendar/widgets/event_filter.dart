import 'package:flutter/material.dart';
import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class EventFilter extends StatelessWidget {
  final Function(AfterType) setFilter;
  final AfterType? filter;

  const EventFilter(this.setFilter, this.filter, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> filters = AfterType.values
        .map(
          (type) => GestureDetector(
            onTap: () => setFilter(type),
            child: Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.symmetric(horizontal: marginXXS(context).height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: type == filter
                    ? type.color.withOpacity(0.6)
                    : Theme.of(context).colorScheme.tertiaryContainer,
              ),
              child: Text(
                type.value,
                style: TextXS(
                    textColor: type == filter
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        )
        .toList();

    return ListView.separated(
      itemCount: filters.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(
        width: marginXXS(context).width,
      ),
      itemBuilder: (context, index) => filters[index],
      padding: EdgeInsets.all(
        marginXXS(context).width,
      ),
    );
  }
}
