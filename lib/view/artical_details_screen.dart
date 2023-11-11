// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const String id = "article_details_screen";
  const ArticleDetailScreen({
    super.key,
    required this.articleData,
  });
  final Results articleData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${articleData.title}")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (articleData.media?.isNotEmpty ?? false)
              Image.network(
                "${articleData.media?.first.mediaMetadata?.first.url}",
                width: double.maxFinite,
                fit: BoxFit.fill,
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Published date:"),
                const Spacer(),
                Text("${articleData.publishedDate}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleData.abstract!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            ElevatedButton(
              onPressed: () => _launchUrl(Uri.parse(articleData.url!)),
              child: const Text('Read more'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
