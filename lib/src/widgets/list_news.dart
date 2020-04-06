import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';


class ListNews extends StatelessWidget {

  final List<Article> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
         return _News(news: this.news[index], index: index,);
      }
    );
  }
}

class _News extends StatelessWidget {

  final Article news;
  final int index;

  const _News({
    @required this.news, 
    @required this.index
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(this.news, this.index),
        _CardTitle(news),
        _CardImage(news),
      ],
    );
  }
}

class _CardImage extends StatelessWidget {

  final Article news;
  const _CardImage(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hi word"),
    );
  }
}

class _CardTitle extends StatelessWidget {

  final Article news;
  const _CardTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(news.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
    );
  }
}

class _CardTopBar extends StatelessWidget {

  final Article news;
  final int index;
  const _CardTopBar(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom:10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}, ', style: TextStyle(color: myTheme.accentColor),),
          Text('${news.source.name }, '),

        ]
      ),
    );
  }
}