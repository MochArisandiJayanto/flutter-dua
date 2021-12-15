import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dua/data/api_service.dart';
import 'package:flutter_dua/data/restaurant_search.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  RestaurantSearchProvider({required this.apiService});

  List<Restaurant> _restaurant = [];
  String _message = '';

  String get message => _message;

  List<Restaurant> get result => _restaurant;

  Future<dynamic> searchRestaurant(String query) async {
    try {
      final restaurant = await apiService.restaurantSearch(query);
      if (restaurant.isEmpty) {
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        notifyListeners();
        return _restaurant = restaurant;
      }
    } catch (e) {
      notifyListeners();
      return _message = "Can't find restaurant";
    }
  }
}
