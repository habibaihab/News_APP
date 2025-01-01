import 'package:flutter/material.dart';
import 'package:news_application/data/data_source/api_manager.dart';
import 'package:news_application/models/category_data.dart';
import 'package:news_application/models/sources_model.dart';

import 'category_view.dart';

class SelectedCategoryView extends StatelessWidget {
  final CategoryData categoryData;
  const SelectedCategoryView({required this.categoryData,super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder(
        future: ApiManager.fetchSourcesList(categoryData.categoryId),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Text("Failed");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            );
          }
          List<Source> sourcesList = snapshot.data ??[];

          return CategoryViewDetails(sourcesList:sourcesList);
        },
    );
  }
}
