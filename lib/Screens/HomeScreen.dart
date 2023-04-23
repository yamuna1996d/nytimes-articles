import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nytimes/Screens/DetailsPage.dart';
import 'package:provider/provider.dart';
import '../ProviderHelper/HomeProvider.dart';
import '../Widgets/ArticleCard.dart';
import '../constraints/constraints.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<PopularArticlesProvider>(context, listen: false)
        .fetch()
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(
            context: context,
            titleWidget: const Text("NY Times Most Popular",
                style: TextStyle(color: Colors.white))),
        body: isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                    radius: 20,
                  ),
                ),
              )
            : Consumer<PopularArticlesProvider>(
                builder: (context, value, child) {
                if (value.popularArticles.isEmpty) {   /*If there are no articles to display, it shows a message "No articles found."*/
                  return const Center(child: Text('No articles found.'));
                } else {
                  return ListView.separated(     /*ListView that displays the popular articles fetched using Consumer*/
                      itemCount: value.popularArticles.length ?? 0,
                      separatorBuilder: (context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: ArticleCard(            /*ArticleCard widget for each popular article*/
                            title: value.popularArticles[index].title,
                            byline: value.popularArticles[index].byline,
                            publishedDate:
                                value.popularArticles[index].publishedDate,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailScreen(       /*NewsDetailScreen widget that displays more information about the article.*/
                                            popularArticles:
                                                value.popularArticles[index],
                                          )));
                            },
                          ),
                        );
                      });
                }
              }));
  }
}
