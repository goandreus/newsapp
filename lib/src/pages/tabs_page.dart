import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tabs1_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  _NavigationModel(),
          child: Scaffold(
        body: _Page(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);
    //final newsService = Provider.of<NewsService>(context);

    return BottomNavigationBar(
      
      onTap: (i) => navigationModel.pageActual = i,
      currentIndex: navigationModel.pageActual,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),title: Text("Para ti")),
        BottomNavigationBarItem(icon: Icon(Icons.public),title: Text("Encabezados")),
      ]
      );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
      Tab1Page(
      ),
      Container(
        color: Colors.green,
      ),
    ],);
  }
}

class _NavigationModel with ChangeNotifier{
  int _pageActual = 0;
  PageController _pageController =  PageController();

  int get pageActual => this._pageActual;
  set pageActual(int valor){
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    this._pageActual = valor;
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}