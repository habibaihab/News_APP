import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsView extends StatefulWidget {
  final Article article;
  const ArticleDetailsView({ required this.article,super.key});

  @override
  State<ArticleDetailsView> createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<ArticleDetailsView> {
  bool isDescriptionVisible = false;
  void _toggleDescription() {
    setState(() {
      isDescriptionVisible = !isDescriptionVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.article.author.isNotEmpty ? widget.article.author : "Unknown Author",
                    style:theme.textTheme.bodyMedium
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: _toggleDescription,
                  child: Text(
                      widget.article.title,
                      style:theme.textTheme.displayMedium
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _formatTimeAgo(widget.article.publishedAt),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                if (isDescriptionVisible) ...[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.description,
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 15,
                        color: const Color(0xFF42505C),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed:()async{
                            final url=Uri.parse(widget.article.url);
                            setState(() {
                              launchUrl(url,mode: LaunchMode.inAppBrowserView);
                            });
                          },
                          child:  Row(
                            children: [
                              Text('View Full Article',style: theme.textTheme.bodyMedium,),
                              const Icon(Icons.arrow_right,color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
    )
    ]
              ],
            ),
  ],
        )
    );
      }

  String _formatTimeAgo(String publishedAt) {
    final date = DateTime.parse(publishedAt);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }
}

