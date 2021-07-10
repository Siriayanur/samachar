import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samachar/helper/news.dart';
import 'package:samachar/models/article.dart';
import 'package:samachar/views/home.dart';


class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  getCategoryNews() async {
    CategoryNewsClass news = CategoryNewsClass();
    await news.getNews(widget.category);
    articles = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SAMACHAR',
                style: GoogleFonts.solway(
                    fontSize: 30,
                    color: Color(0xffFF5733),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.sanitizer),
              ),
            ),
          ],
        ),
        body: isLoading ? Center(
          child: (
            Container(
              child: CircularProgressIndicator(backgroundColor: Color(0xffFF5733),),
            )
          ),
        ) : SingleChildScrollView(
                  child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Article(
                          imageUrl: articles[index].urlToImage ?? "",
                          title: articles[index].title ?? "",
                          desc: articles[index].description ?? "",
                          url: articles[index].url ?? "",
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
