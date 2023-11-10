import 'package:flutter/material.dart';
import 'package:new_york_times/data/articles_list.dart';

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
                leading: articlesList![index].media?.first.mediaMetadata?.first.url != null
                    ? CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage("${articlesList![index].media?.first.mediaMetadata?.first.url}"),
                        backgroundColor: Colors.transparent,
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                onTap: () {
                  print("object");
                },
                title: Text("${articlesList?[index].title}"),
              ),
            ));
  }
}
