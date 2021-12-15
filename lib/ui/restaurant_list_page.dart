import 'package:flutter/material.dart';
import 'package:flutter_dua/theme/theme.dart';
import 'package:flutter_dua/provider/restaurant_provider.dart';
import 'package:flutter_dua/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return Center(
          child: CircularProgressIndicator(
            color: green,
          ),
        );
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return RestaurantCard(restaurant: restaurant);
            });
      } else if (state.state == ResultState.noData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.error) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: Text(''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}
