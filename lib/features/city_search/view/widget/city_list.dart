import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

class CityList extends StatefulWidget {
  const CityList({
    super.key,
  });

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 8) {
      context.read<CitySearchCubit>().getCitiesNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchCubit, CitySearchState>(
      builder: (context, state) {
        if (state.status.isFailure) {
          return Center(
            child: Text(state.message ?? 'Failed to load cities'),
          );
        }
        if (state.status.isInitial) {
          return const Center(
            child: Text('Search for cities'),
          );
        }

        final citiesLength = state.status.isLoading && state.meta.lastPage > 1
            ? state.cities.length + 1
            : state.cities.length;

        if (citiesLength == 0) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text('No cities found'),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          controller: _scrollController,
          itemCount: citiesLength,
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemBuilder: (context, index) {
            if (index >= state.cities.length) {
              return const ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Center(
                  child: SizedBox.square(
                    dimension: 33,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            final city = state.cities[index];
            return ListTile(
              tileColor: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(city.name),
              subtitle: Text(city.country.name),
            );
          },
        );
      },
    );
  }
}
