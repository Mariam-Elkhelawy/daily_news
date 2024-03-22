import 'package:flutter/material.dart';
import 'package:news_app/models/source_response_model.dart';

class SourceItemWidget extends StatelessWidget {
  const SourceItemWidget(
      {super.key, required this.sources, required this.isSelected});
  final Sources sources;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor,width: 2),
          color: isSelected ? theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          sources.name ?? '',
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: isSelected ? Colors.white : theme.primaryColor),
        ),
      ),
    );
  }
}
