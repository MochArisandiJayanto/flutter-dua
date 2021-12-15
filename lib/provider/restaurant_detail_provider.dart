import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dua/data/api_service.dart';
import 'package:flutter_dua/data/restaurant_detail.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  late RestaurantDetail _restaurantDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetail get result => _restaurantDetail;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail(id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantDetail = await apiService.getRestaurantDeatail(id);
      _state = ResultState.hasData;
      notifyListeners();
      return _restaurantDetail = restaurantDetail;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Failed to load detail restaurant';
    }
  }
}
