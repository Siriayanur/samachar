import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samachar/helper/data.dart';
import 'package:samachar/helper/news.dart';
import 'package:samachar/models/article.dart';
import 'package:samachar/models/category.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:samachar/views/article_view.dart';
import 'package:samachar/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool isLoading = false;

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    categories = getCategories();
    getNews();
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
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xffFF5733),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    ////Categories list --> horizontal view
                    SingleChildScrollView(
                      child: Container(
                        height: 70,
                        child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryContainer(
                                categoryName: categories[index].categoryName,
                                imageUrl: categories[index].imageUrl,
                              );
                            }),
                      ),
                    ),

                    //// News Articles
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
            ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryContainer({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              //To prevent image from loading from network every time
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {
  final String imageUrl, title, desc, url;
  Article(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      articleUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Image.network(imageUrl),
            SizedBox(
              height: 8,
            ),
            Text(title,
                style: GoogleFonts.notoSans(
                    color: Color(0xff171010),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style:
                  GoogleFonts.notoSans(color: Color(0xff423F3E), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
