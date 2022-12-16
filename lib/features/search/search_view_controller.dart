import 'package:flutter/material.dart';

import 'search_view.dart';

abstract class SearchViewProtocol extends SearchViewModelProtocol {}

class SearchViewController extends StatefulWidget {
  final SearchViewProtocol viewModel;

  const SearchViewController({super.key, required this.viewModel});

  @override
  State<SearchViewController> createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  @override
  Widget build(BuildContext context) {
    return SearchView(viewModel: widget.viewModel);
  }
}
