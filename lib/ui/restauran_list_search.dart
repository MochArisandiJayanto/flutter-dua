import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dua/provider/restaurant_search_provider.dart';
import 'package:flutter_dua/widgets/restaurant_search_card.dart';
import 'package:provider/provider.dart';

class RestaurantSearchList extends StatelessWidget {
  const RestaurantSearchList({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<RestaurantSearchProvider>(builder: (context, state, _) {
      return ListView.builder(
        itemCount: state.result.length,
        itemBuilder: (context, index) {
          final restaurant = state.result[index];
          return RestaurantSearchCard(restaurant: restaurant);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}
