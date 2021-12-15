import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dua/provider/restaurant_search_provider.dart';
import 'package:flutter_dua/screens/get_started.dart';
import 'package:flutter_dua/theme/theme.dart';
import 'package:flutter_dua/data/api_service.dart';
import 'package:flutter_dua/provider/restaurant_provider.dart';
import 'package:flutter_dua/ui/restaurant_list_page.dart';
import 'package:flutter_dua/ui/search_page.dart';
import 'package:flutter_dua/widgets/no_connection.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => RestaurantSearchProvider(
          apiService: ApiService(),
        ),
        child: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: -500.0,
                    elevation: 0,
                    pinned: true,
                    floating: true,
                    stretch: true,
                    bottom: AppBar(
                      toolbarHeight: 70,
                      elevation: 0,
                      backgroundColor: Colors.teal[800],
                      title: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 50,
                            child: TextField(
                              readOnly: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search, color: green),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchPage()));
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                                hintText: "Search",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          )),
                          const SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.people,
                                color: green,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: StreamBuilder<ConnectivityResult>(
                stream: Connectivity().onConnectivityChanged,
                builder: (_, snapshot) => snapshot.hasData
                    ? connectivity(snapshot.data!)
                    : const NoConnection(),
              )),
        ),
      ),
    );
  }

  Widget connectivity(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return const NoConnection();
    } else {
      return Container(
        color: Colors.teal[200],
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MAJ Restaurant',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Recommendation restaurant for you!',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 17,
            ),
            Expanded(
              child: ChangeNotifierProvider(
                create: (_) => RestaurantProvider(apiService: ApiService()),
                child: const RestaurantListPage(),
              ),
            )
          ],
        ),
      );
    }
  }
}
