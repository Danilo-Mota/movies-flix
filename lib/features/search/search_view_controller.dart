import 'package:flutter/material.dart';

import 'search_view.dart';

abstract class SearchViewProtocol extends SearchViewModelProtocol {}

class SearchViewController extends StatefulWidget {
  final SearchViewProtocol viewModel;
  static const String route = '/search';

  const SearchViewController({super.key, required this.viewModel});

  @override
  State<SearchViewController> createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  late final SearchViewProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return SearchView(viewModel: viewModel);
  }
}
