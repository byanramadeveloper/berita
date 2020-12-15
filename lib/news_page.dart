import 'package:flutter/material.dart';
import 'category_item.dart';
import 'models/category.dart';
import 'models/respon_berita.dart';
import 'news_item.dart';

class NewsPage extends StatelessWidget {
  ResponBerita _responBerita;
  List<Category> _categories;

  NewsPage(this._responBerita, this._categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 70.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (contex, index) {
                  return CategoryItem(
                      imageUrl: _categories[index].imageUrl,
                      categoryName: _categories[index].categoryName);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                itemCount: _responBerita.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  String imgUrl =
                      _responBerita.articles[index].urlToImage ?? "";
                  String title = _responBerita.articles[index].title ?? "";
                  String descripsi =
                      _responBerita.articles[index].description ?? "";
                  String content = _responBerita.articles[index].content ?? "";
                  String url = _responBerita.articles[index].url ?? "";
                  String sumber =
                      _responBerita.articles[index].source.name ?? "";
                  return NewsItem(
                      imgUrl, title, descripsi, content, url, sumber);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
