import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    var provider = Provider.of<MyProvider>(context);
    List<String> langList = [local.english, local.arabic];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                local.language,
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Color(0xFF42505C)),
              ),
              const SizedBox(height: 14),
              CustomDropdown(
                initialItem: provider.languageCode == 'en'
                    ? local.english
                    : local.arabic,
                hintText: local.selectLanguage,
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
                  headerStyle: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppTheme.primaryColor, fontSize: 18),
                  listItemStyle: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppTheme.primaryColor, fontSize: 18),
                  closedBorder: Border.all(color: AppTheme.primaryColor),
                  closedFillColor: Colors.white,
                  expandedFillColor: Colors.white,
                ),
                items: langList,
                onChanged: (value) {
                  if (value == local.arabic) {
                    provider.changeLanguageCode('ar');
                  } else if (value == local.english) {
                    provider.changeLanguageCode('en');
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
