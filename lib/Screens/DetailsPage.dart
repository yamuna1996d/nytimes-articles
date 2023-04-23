import 'package:flutter/material.dart';
import '../Models/ProductModel.dart';
import '../Widgets/TitleBold500.dart';
import '../constraints/constraints.dart';

class NewsDetailScreen extends StatelessWidget {
  final Results? popularArticles;
   NewsDetailScreen({Key? key,this.popularArticles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: popularArticles?.media?.length!=0?Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(popularArticles?.media?[0].mediaMetadata?[0].url??""),
                    fit: BoxFit.cover,
                  ),
                ),
              ):
              Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: NetworkImage( "https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ),
            Details(popularArticles: popularArticles),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.popularArticles,
  }) : super(key: key);

  final Results? popularArticles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: grey1, width: 1.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child:
                Text(
                  popularArticles?.section??"",
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: grey1,
                      fontWeight: FontWeight.bold,
                  ),
                ),),
          const SizedBox(height: 5,),
          TitleBold500(
            title: popularArticles?.title??"",
            fontSize: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: TitleBold500(
              title: "Published Date :  ${popularArticles?.publishedDate}",
              fontSize: 13,
              titleColor: dimBlack,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleBold500(
                  title: popularArticles?.byline??"",
                  titleColor: grey1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TitleBold500(
              title: popularArticles?.abstract??"",
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.justify,
              titleColor: grey1,
            ),
          ),
        ],
      ),
    );
  }
}


