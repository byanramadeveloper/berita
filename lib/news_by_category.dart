import 'package:flutter/material.dart';
import 'helper/data_request.dart';
import 'helper/my_widget.dart';
import 'models/respon_berita.dart';
import 'news_item.dart';

class NewsByCategory extends StatefulWidget {
  String _newsCategory;

  NewsByCategory(this._newsCategory);

  @override
  _NewsByCategoryState createState() => _NewsByCategoryState(_newsCategory);
}

class _NewsByCategoryState extends State<NewsByCategory> {
  RequestByCategory _requestByCategory = RequestByCategory();
  String categoryName;

  _NewsByCategoryState(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: myAppBar(),
      body: FutureBuilder(
        future: _requestByCategory.getNewsByCategory(categoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListNewsCategory(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text("Data tidak tersedia"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponBerita _responBerita;

  ListNewsCategory(this._responBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          itemCount: _responBerita.articles.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            String imgUrl = _responBerita.articles[index].urlToImage ?? "";
            String title = _responBerita.articles[index].title ?? "";
            String descripsi = _responBerita.articles[index].description ?? "";
            String content = _responBerita.articles[index].content ?? "";
            String url = _responBerita.articles[index].url ?? "";
            String sumber = _responBerita.articles[index].source.name ?? "";
            return NewsItem(imgUrl, title, descripsi, content, url, sumber);
          },
        ),
      ),
    );
  }
}
