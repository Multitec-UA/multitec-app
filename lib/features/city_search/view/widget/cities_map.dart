import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sq1_assignment/features/city_search/city_search.dart';

class CitiesMap extends StatelessWidget {
  const CitiesMap({super.key});

  @override
  Widget build(BuildContext context) {
    final cities =
        context.select((CitySearchCubit cubit) => cubit.state.cities);
    final firstLocation = context.read<CitySearchCubit>().getFirstLocation();

    return _CitiesMapView(
      cities: cities,
      firstLocation: firstLocation,
    );
  }
}

class _CitiesMapView extends StatefulWidget {
  const _CitiesMapView({
    required this.cities,
    this.firstLocation,
  });

  final List<City> cities;
  final Location? firstLocation;

  @override
  State<_CitiesMapView> createState() => __CitiesMapViewState();
}

class __CitiesMapViewState extends State<_CitiesMapView> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addCityMarkers();
  }

  @override
  void didUpdateWidget(covariant _CitiesMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cities != widget.cities) {
      _addCityMarkers();
      if (widget.firstLocation != null) {
        _mapController.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(
              widget.firstLocation!.latitude,
              widget.firstLocation!.longitude,
            ),
          ),
        );
      }
    }
  }

  void _addCityMarkers() {
    _markers.clear();
    for (final city in widget.cities) {
      if (city.location != null) {
        _markers.add(
          Marker(
            markerId: MarkerId(city.id.toString()),
            position: LatLng(city.location!.latitude, city.location!.longitude),
            infoWindow: InfoWindow(
              title: city.name,
              snippet: city.country.name,
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        _mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: widget.firstLocation != null
            ? LatLng(
                widget.firstLocation!.latitude,
                widget.firstLocation!.longitude,
              )
            : const LatLng(0, 0),
        zoom: 4,
      ),
      markers: _markers,
    );
  }
}
