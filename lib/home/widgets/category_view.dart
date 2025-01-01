import 'package:flutter/material.dart';
import 'package:news_application/data/data_source/api_manager.dart';
import 'package:news_application/home/widgets/news_view.dart';
import 'package:news_application/home/widgets/tab_item_widget.dart';
import 'package:news_application/models/articles_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/sources_model.dart';

class CategoryViewDetails extends StatefulWidget {
  final List<Source> sourcesList;

  const CategoryViewDetails({ required this.sourcesList,super.key});

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  int selectedIndex=0;
  @override
  void initState() {
    super.initState();
    // Ensure selectedIndex is within range when initializing
    if (widget.sourcesList.isEmpty) {
      selectedIndex = 0; // or handle this case appropriately
    }
  }
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    if (widget.sourcesList.isEmpty) {
      return  Center(child: Text(lang.no_sources_available));
    }
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex =index;

                });
              },
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              indicator: const BoxDecoration(),
              indicatorPadding: EdgeInsets.zero,
              padding: const EdgeInsets.only(top: 20),
              isScrollable: true,
                tabs:widget.sourcesList.map((source) => TabItemWidget(
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                    source: source),).toList()
            )
        ),
        FutureBuilder <List<Article>>(
            future: ApiManager.fetchArticlesList(widget.sourcesList[selectedIndex].id),
            builder:(context, snapshot){
              if (snapshot.hasError) {
                return const Text("Failed");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),);
              }
              List<Article> articlesList=snapshot.data ??[];
              return Expanded(
                child: ListView.builder(
                    itemCount: articlesList.length,
                    itemBuilder: (context, index){
                  return ArticleDetailsView(article: articlesList[index]);
                }
                ),
              );
             
            }
              )
      ],
    );
  }
}
