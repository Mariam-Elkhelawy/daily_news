import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/styles/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<String> langList = ['english', 'arabic'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'language',
                style: theme.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              CustomDropdown(
                initialItem: 'arabic',
                hintText: 'Select Language',
                decoration: CustomDropdownDecoration(
                  closedSuffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppTheme.primaryColor,
                  ),
                  expandedSuffixIcon: const Icon(
                    Icons.keyboard_arrow_up,
                    color: AppTheme.primaryColor,
                  ),
                  closedBorderRadius: BorderRadius.zero,
                  expandedBorderRadius: BorderRadius.zero,
                  headerStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: AppTheme.primaryColor),
                  listItemStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: AppTheme.primaryColor),
                  closedBorder: Border.all(color: AppTheme.primaryColor),
                  closedFillColor: Colors.white,
                  expandedFillColor: Colors.white,
                ),
                items: langList,
                onChanged: (p0) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
