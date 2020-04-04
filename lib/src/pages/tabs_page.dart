import 'package:flutter/material.dart';
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
    ],);
  }
}

class _NavigationModel with ChangeNotifier{
  int _pageActual = 0;

  int get pageActual => this._pageActual;
  set pageActual(int valor){
    this._pageActual = valor;
    notifyListeners();
  }
}