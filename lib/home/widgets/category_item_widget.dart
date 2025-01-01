import 'package:flutter/material.dart';
import 'package:news_application/models/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final int index;
  final void Function(CategoryData categoryData) onCategoryClicked;
  const CategoryItemWidget({ required this.categoryData,
    required this.index,
    required this.onCategoryClicked,
    super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap:() {
        onCategoryClicked(categoryData);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10,top: 10,left: 10,right: 10),
        decoration:  BoxDecoration(
          color: categoryData.categoryBackground,
          borderRadius:BorderRadius.only(
            bottomLeft:index%2!=0?Radius.circular(0):Radius.circular(25),
            bottomRight:index%2==0?Radius.circular(0):Radius.circular(25),
            topLeft:Radius.circular(25),
            topRight:Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Expanded(child:Image.asset(categoryData.categoryIcon),
            ),
            Text(categoryData.categoryName,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 22,
            ),)

          ],
        ),
      ),
    );
  }
}
