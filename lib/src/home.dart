import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movie/src/provider/bottom_navigation_provider.dart';
import 'package:provider_movie/src/provider/count_provider.dart';
import 'package:provider_movie/src/ui/count_home_widget.dart';
import 'package:provider_movie/src/ui/movie_list_widget.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);
  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();
      case 1:
        return MovieListWidget();
    }
    return Container();
  }

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie')
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.cyan,
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Count'),
      ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationWidget(),
    );
  }
}