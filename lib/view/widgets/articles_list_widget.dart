import 'package:flutter/material.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:new_york_times/view/artical_details_screen.dart';

class ArticlesListWidget extends StatelessWidget {
  const ArticlesListWidget({
    super.key,
    required this.articlesList,
  });

  final List<Results>? articlesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: articlesList?.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: articlesList?[index].media?.isNotEmpty ?? false
                    ? CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage("${articlesList![index].media?.first.mediaMetadata?.first.url}"),
                        backgroundColor: Colors.transparent,
                      )
                    : const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey,
                      ),
                onTap: () {
                  Navigator.of(context).pushNamed(ArticleDetailScreen.id, arguments: articlesList![index]);
                },
                title: Text("${articlesList?[index].title}"),
              ),
            ));
  }
}
