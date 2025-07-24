import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sq1_assignment/core/di/service_locator.dart';
import 'package:sq1_assignment/feature/city_search/city_search.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitySearchCubit(
        repository: locator<CitySearchRepository>(),
      ),
      child: const _CitySearchView(),
    );
  }
}

class _CitySearchView extends StatelessWidget {
  const _CitySearchView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('City Search'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.map_outlined)),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: SearchTextBar(
                elevation: 2,
                hintText: 'Search for cities',
                onSubmitted: (value) {
                  context.read<CitySearchCubit>().newCitySearch(value);
                },
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CityList(),
                  CitiesMap(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
