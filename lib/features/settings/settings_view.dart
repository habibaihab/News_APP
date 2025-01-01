import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../home/widgets/custom_drawer_widget.dart';
import '../../models/category_data.dart';
import '../../theme/settings_provider.dart';

class SettingsView extends StatefulWidget {
  static String routeName = "Settings";
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final List<String> _languages = ["English", "عربي"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.settings,style: theme.textTheme.titleLarge,),
        centerTitle: true, // AppBar title, fetched from localization
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.language,
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,  // Set border color to green
                      width: 2.0,           // Border width
                    ),
                  ),
                  child: CustomDropdown<String>(
                    hintText: lang.language,
                    items: _languages,
                    onChanged: (value) {
                      if (value == "English") {
                        provider.changeCurrentLanguage("en");
                      } else if (value == "عربي") {
                        provider.changeCurrentLanguage("ar");
                      }
                      log('Language changed to: $value');
                    },
                    decoration: CustomDropdownDecoration(
                      headerStyle: TextStyle(
                        color: theme.primaryColor,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                      closedSuffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: theme.primaryColor,
                      ),
                      expandedSuffixIcon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: theme.primaryColor,
                      ),



                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  // void onCategoryChangedClicked(){
  //   setState(() {
  //     selectedCategoryData = null;
  //     Navigator.pop(context);
  //   });
  // }
}
