import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/count_provider.dart';

class ViewCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('object');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(
            Provider.of<CountProvider>(context).count.toString(),
            style: TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}