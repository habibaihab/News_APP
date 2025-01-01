import 'package:flutter/material.dart';
import 'package:news_application/home/widgets/category_item_widget.dart';
import 'package:news_application/home/widgets/custom_drawer_widget.dart';
import 'package:news_application/home/widgets/selected_category_view.dart';
import '../models/category_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayOutView extends StatefulWidget {
  static String routeName = "Layout";
  const LayOutView({super.key});


  @override
  State<LayOutView> createState() => _LayOutViewState();

}

class _LayOutViewState extends State<LayOutView> {
  List<CategoryData> categoryDataListEN=[
    CategoryData(
        categoryId: "sports",
        categoryName: "Sports",
        categoryIcon: "assets/icons/sports.png",
        categoryBackground: const Color(0xFFC91C22),
    ),
    CategoryData(
      categoryId: "science",
      categoryName: "Science",
      categoryIcon: "assets/icons/science.png",
      categoryBackground: const Color(0xFFF2D352),
    ),
    CategoryData(
      categoryId: "health",
      categoryName: "Health",
      categoryIcon: "assets/icons/health.png",
      categoryBackground: const Color(0xFFED1E79),
    ),
    CategoryData(
      categoryId: "general",
      categoryName: "Politics",
      categoryIcon: "assets/icons/Politics.png",
      categoryBackground: const Color(0xFF003E90),
    ),
    CategoryData(
      categoryId: "environment",
      categoryName: "Environment",
      categoryIcon: "assets/icons/environment.png",
      categoryBackground: const Color(0xFF4882CF),
    ),
    CategoryData(
      categoryId: "business",
      categoryName: "Business",
      categoryIcon: "assets/icons/business.png",
      categoryBackground: const Color(0xFF4882CF),
    ),
  ];
  List<CategoryData> categoryDataListAR = [
    CategoryData(
      categoryId: "sports",
      categoryName: "رياضة",
      categoryIcon: "assets/icons/sports.png",
      categoryBackground: const Color(0xFFC91C22),
    ),
    CategoryData(
      categoryId: "science",
      categoryName: "علوم",
      categoryIcon: "assets/icons/science.png",
      categoryBackground: const Color(0xFFF2D352),
    ),
    CategoryData(
      categoryId: "orig",
      categoryName: "صحة",
      categoryIcon: "assets/icons/health.png",
      categoryBackground: const Color(0xFFED1E79),
    ),
    CategoryData(
      categoryId: "general",
      categoryName: "سياسة",
      categoryIcon: "assets/icons/Politics.png",
      categoryBackground: const Color(0xFF003E90),
    ),
    CategoryData(
      categoryId: "environment",
      categoryName: "البيئة",
      categoryIcon: "assets/icons/environment.png",
      categoryBackground: const Color(0xFF4882CF),
    ),
    CategoryData(
      categoryId: "business",
      categoryName: "أعمال",
      categoryIcon: "assets/icons/business.png",
      categoryBackground: const Color(0xFF4882CF),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var currentLocale = Localizations.localeOf(context).languageCode;
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<CategoryData> categoryDataList = currentLocale == 'ar' ? categoryDataListAR : categoryDataListEN;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image:DecorationImage(
            image: AssetImage("assets/images/pattern.png") ,)
      ),
      child: Scaffold(
        drawer:CustomeDrawerWidget(onCategoryChangedClicked: onCategoryChangedClicked,),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              selectedCategoryData==null?lang.news_app: selectedCategoryData!.categoryName),
          centerTitle: true,
          actions: [
            if(selectedCategoryData != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(onPressed: () {

                }, icon: const Icon(Icons.search_rounded,size: 40,color: Colors.white,)),
              )
          ],
        ),
        body: selectedCategoryData == null ?Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lang.pick_your_category,
              style: theme.textTheme.bodyLarge,),
              const SizedBox(height: 15,),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.90,
                ),
                  itemBuilder: (context, index) => CategoryItemWidget(categoryData: categoryDataList[index]
                  , index:index, onCategoryClicked: onClickedCategory,
                  ),
                  itemCount: categoryDataList.length,
                ),
              )

            ],
          ),
        ) : SelectedCategoryView(categoryData:selectedCategoryData!),

      ),
    );
  }
   CategoryData ? selectedCategoryData;
  void onClickedCategory(CategoryData categoryData){
    setState(() {
      selectedCategoryData = categoryData;
    });


  }
  void onCategoryChangedClicked(){
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}