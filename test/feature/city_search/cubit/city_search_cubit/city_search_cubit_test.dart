import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sq1_assignment/feature/city_search/city_search.dart';
import 'package:sq1_assignment/core/network/network_service.dart';

import 'city_search_cubit_test.mocks.dart';

@GenerateMocks([CitySearchRepository])
void main() {
  provideDummy<Result<PaginatedData<City>, String>>(
    const Success(PaginatedData(items: [], meta: PaginationMeta(lastPage: 2))),
  );
  provideDummy<Result<Unit, String>>(const Success(unit));

  late CitySearchCubit cubit;
  late MockCitySearchRepository mockRepository;

  setUp(() {
    mockRepository = MockCitySearchRepository();
    cubit = CitySearchCubit(repository: mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('CitySearchCubit', () {
    const query = 'Test City';
    const paginatedData = PaginatedData(
      items: [
        City(
          id: 0,
          name: 'Test City',
          country: Country(id: 0, name: 'Test Country', code: 'TST'),
          location: Location(latitude: 0, longitude: 0),
        ),
      ],
      meta: PaginationMeta(
        perPage: 1,
        totalResults: 2,
        lastPage: 2,
      ),
    );

    test('initial state is correct', () {
      expect(
        cubit.state,
        const CitySearchState(status: CitySearchStatus.initial),
      );
    });

    blocTest<CitySearchCubit, CitySearchState>(
      'emits [initial, loading, success] when searchCitiesByName is successful',
      build: () {
        when(mockRepository.getCitiesByName(name: query, page: 1))
            .thenAnswer((_) async => const Success(paginatedData));
        return cubit;
      },
      act: (cubit) => cubit.newCitySearch(query),
      expect: () => [
        const CitySearchState(status: CitySearchStatus.initial),
        const CitySearchState(status: CitySearchStatus.loading, query: query),
        CitySearchState(
          status: CitySearchStatus.success,
          cities: paginatedData.items,
          meta: paginatedData.meta,
          query: query,
        ),
      ],
    );

    blocTest<CitySearchCubit, CitySearchState>(
      'emits [initial, loading, failure] when searchCitiesByName fails',
      build: () {
        when(mockRepository.getCitiesByName(name: query, page: 1))
            .thenAnswer((_) async => const Error('Error message'));
        return cubit;
      },
      act: (cubit) => cubit.newCitySearch(query),
      expect: () => [
        const CitySearchState(status: CitySearchStatus.initial),
        const CitySearchState(status: CitySearchStatus.loading, query: query),
        const CitySearchState(
          status: CitySearchStatus.failure,
          query: query,
          message: 'Error message',
        ),
      ],
    );

    blocTest<CitySearchCubit, CitySearchState>(
      'emits [initial, loading, success] for pagination',
      build: () {
        when(mockRepository.getCitiesByName(name: query, page: 1))
            .thenAnswer((_) async => const Success(paginatedData));
        when(mockRepository.getCitiesByName(name: query, page: 2)).thenAnswer(
          (_) async => Success(
            paginatedData.copyWith(
              items: [
                const City(
                  id: 3,
                  name: 'Another City',
                  country: Country(
                    id: 3,
                    name: 'Another Country',
                    code: 'ACN',
                  ),
                  location: Location(latitude: 1, longitude: 1),
                ),
              ],
              meta: const PaginationMeta(
                perPage: 1,
                totalResults: 2,
                currentPage: 2,
                lastPage: 2,
              ),
            ),
          ),
        );
        return cubit;
      },
      act: (cubit) async {
        await Future.microtask(() => cubit.newCitySearch(query));
        await Future.microtask(() => cubit.getCitiesNextPage());
      },
      expect: () => [
        const CitySearchState(status: CitySearchStatus.initial),
        const CitySearchState(status: CitySearchStatus.loading, query: query),
        CitySearchState(
          status: CitySearchStatus.success,
          cities: paginatedData.items,
          meta: paginatedData.meta,
          query: query,
        ),
        CitySearchState(
          status: CitySearchStatus.loading,
          cities: paginatedData.items,
          meta: paginatedData.meta,
          query: query,
        ),
        CitySearchState(
          status: CitySearchStatus.success,
          cities: [
            ...paginatedData.items,
            const City(
              id: 3,
              name: 'Another City',
              country: Country(
                id: 3,
                name: 'Another Country',
                code: 'ACN',
              ),
              location: Location(latitude: 1, longitude: 1),
            ),
          ],
          meta: const PaginationMeta(
            perPage: 1,
            totalResults: 2,
            currentPage: 2,
            lastPage: 2,
          ),
          query: query,
        ),
      ],
    );
  });
}
