import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movie/src/components/view_count.dart';
import '../provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _countProvider.add();
              }
          ),
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _countProvider.remove();
              }
          ),
        ],
      ),
    );
  }
}