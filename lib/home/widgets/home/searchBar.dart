import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../../../colors.dart';

class SearchBarView extends StatefulWidget {
  @override
  State<SearchBarView> createState() => SearchBarViewState();
}

class SearchBarViewState extends State<SearchBarView> {
  final _formKey = GlobalKey<FormState>();
  void onSearch(value) {
    print("SEARCH: $value");
  }

  String searchBarValidator(value) {
    print("VALUE SEARCBAR $value");

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return SearchField(
      suggestions: [
        SearchFieldListItem("1item", child: Text("1item")),
        SearchFieldListItem("2item", child: Text("2item")),
        SearchFieldListItem("3item", child: Text("3item")),
        SearchFieldListItem("4item", child: Text("4item")),
        SearchFieldListItem("5item", child: Text("5item")),
      ],
      maxSuggestionsInViewPort: 5,
      itemHeight: 60,
      hint: "Search",
      autoCorrect: true,
      searchInputDecoration: InputDecoration(
        fillColor: AppColor().searchBarColor,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: AppColor().colorGrye,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: AppColor().searchBarColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: AppColor().searchBarColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: AppColor().searchBarColor)),
      ),
    );
  }
}
