import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodt/controller/news_controller.dart';

class FilterChipDemo extends StatefulWidget {
  const FilterChipDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  final NewsController controller = Get.put(NewsController());

  final List<String> _filters = [
    'national',
    'all',
    'sports',
    'business',
    'world',
    'politics',
    'technology',
    'startup',
    'entertainment',
    'hatke',
    'science',
    'automobile',
    'miscellaneous'
  ];
  String _selectedFilter = 'national'; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _filters.map((String filter) {
          return Container(
            margin: const EdgeInsets.fromLTRB(2, 5, 2, 0),
            child: FilterChip(
              label: Text(filter),
              selected: _selectedFilter == filter,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _selectedFilter = filter;
                    controller.fetchNews(filter);
                  } else {
                    _selectedFilter = 'national';
                     controller.fetchNews('national');
                  }
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
