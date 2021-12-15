import 'package:flutter/material.dart';
import 'package:flutter_dua/data/api_service.dart';
import 'package:flutter_dua/provider/restaurant_detail_provider.dart';
import 'package:flutter_dua/ui/detail_retaurant_page.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) =>
            RestaurantDetailProvider(apiService: ApiService(), id: id),
        child: DetailRestaurantPage(
          id: id,
        ),
      ),
    );
  }
}
