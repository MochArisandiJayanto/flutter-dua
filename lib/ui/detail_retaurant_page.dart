import 'package:flutter/material.dart';
import 'package:flutter_dua/theme/theme.dart';
import 'package:flutter_dua/provider/restaurant_detail_provider.dart';
import 'package:flutter_dua/widgets/detail_restaurant.dart';
import 'package:provider/provider.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String id;

  const DetailRestaurantPage({Key? key, required this.id}) : super(key: key);

  Widget _buildList() {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return Center(
          child: CircularProgressIndicator(
            color: green,
          ),
        );
      } else if (state.state == ResultState.hasData) {
        var restaurant = state.result.restaurant;
        return DetailRestaurant(
          id: id,
          restaurant: restaurant,
        );
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
