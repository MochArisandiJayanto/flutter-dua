import 'dart:convert';
import 'package:flutter_dua/data/restaurant.dart' as restoran;
import 'package:flutter_dua/data/restaurant_search.dart' as search;
import 'package:flutter_dua/data/restaurant_detail.dart';
import 'package:flutter_dua/data/restaurant_search.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<restoran.RestaurantResult> getRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + "/list"));
    if (response.statusCode == 200) {
      return restoran.RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant');
    }
  }

  Future<RestaurantDetail> getRestaurantDeatail(_id) async {
    final response = await http.get(Uri.parse(_baseUrl + "/detail/" + _id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<List<search.Restaurant>> restaurantSearch(String query) async {
    query.replaceAll(" ", "&");
    final response = await http.get(Uri.parse(_baseUrl + "/search?q=" + query));
    RestaurantSearch map = search.RestaurantSearch.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      if(map.founded>0){
        Map<String, dynamic> map = json.decode(response.body);
        final List restaurants = map["restaurants"];
        return restaurants
          .map((json) => search.Restaurant.fromJson(json))
          .toList();
      }else{
        return List<search.Restaurant>.empty();
      }
    } else {
      return List<search.Restaurant>.empty();
    }
  }
}
