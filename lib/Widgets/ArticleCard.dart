import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  String? title, byline, publishedDate;
  final void Function()? onTap;
  ArticleCard(
      {Key? key, this.byline, this.onTap, this.title, this.publishedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title ?? "",
          maxLines: 2,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              byline ?? "",
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.date_range),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  publishedDate ?? "",
                ),
              ],
            )
          ],
        ),
        leading: const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
        ),
        trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios), onPressed: onTap));
  }
}
