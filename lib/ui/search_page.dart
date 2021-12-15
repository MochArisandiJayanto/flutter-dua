import 'package:flutter/material.dart';
import 'package:flutter_dua/data/api_service.dart';
import 'package:flutter_dua/provider/restaurant_search_provider.dart';
import 'package:flutter_dua/ui/restauran_list_search.dart';
import 'package:flutter_dua/widgets/search.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestaurantSearchProvider(apiService: ApiService()),
      child: Consumer<RestaurantSearchProvider>(
          builder: (context, RestaurantSearchProvider provider, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search Restaurant',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
            backgroundColor: Colors.teal[800],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Wrap(children: [
                  Search(
                    query: query,
                    hintText: 'Restaurant Name',
                    onChanged: (query) {
                      query = query;
                      Provider.of<RestaurantSearchProvider>(context,
                              listen: false)
                          .searchRestaurant(query);
                    },
                  ),
                ]),
                const Expanded(child: RestaurantSearchList())
              ],
            ),
          ),
        );
      }),
    );
  }
}
