import 'package:flutter/material.dart';

import '../../models/sources_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabItemWidget extends StatefulWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget({required this.source,required this.isSelected,
    super.key});

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {


  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      decoration: BoxDecoration(
        color: widget.isSelected ?theme.primaryColor: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: theme.primaryColor,
        )
      ),
      child: Text(
        widget.source.name,
        style:theme.textTheme.displayMedium?.copyWith(
          color:widget.isSelected ?Colors.white: theme.primaryColor,
        ),
      ),
    );
  }
}
