import 'package:flutter/material.dart';
import 'package:flutter_dua/data/restaurant_search.dart';
import 'package:flutter_dua/provider/restaurant_search_provider.dart';
import 'package:flutter_dua/theme//theme.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  final String query;
  final ValueChanged<String> onChanged;
  final String hintText;

  const Search({
    Key? key,
    required this.query,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: black);
    final styleHint = TextStyle(color: grey);
    final style = widget.query.isEmpty ? styleHint : styleActive;

    return Container(
      height: 45,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: green),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: InkWell(
              onTap: (){
                setState(() {
                  Provider.of<RestaurantSearchProvider>(context,
                      listen: false)
                      .searchRestaurant(controller.text);
                });
              },
              child: Icon(Icons.search, color: style.color)),

          suffixIcon: widget.query.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
      ),
    );
  }
}
