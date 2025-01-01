import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_application/features/settings/settings_view.dart';

class CustomeDrawerWidget extends StatelessWidget {
  final void Function()? onCategoryChangedClicked;
  const CustomeDrawerWidget({required this.onCategoryChangedClicked,super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme =Theme.of(context);
    var mediaQuery=MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width*0.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.height*0.2,
            color: theme.primaryColor,
            child: Text("${lang.news_app}!" ,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 28,
              color: Colors.white,
            ),),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              onCategoryChangedClicked!();

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.view_list_rounded,size: 35,color: Colors.black,),
                  const SizedBox(width: 8,),
                  Text(lang.categories,style: theme.textTheme.displayLarge,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsView()), // Assuming SettingsView exists
              );

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.settings,size: 35,color: Colors.black,),
                  const SizedBox(width: 8,),
                  Text(lang.settings,style: theme.textTheme.displayLarge,)
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
