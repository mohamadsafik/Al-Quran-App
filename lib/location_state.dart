import 'package:tests/models/location_model.dart';

abstract class LocationState {}

class LocationLoadingState extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationLoadState extends LocationState {
  final List<LocationModel> locations;

  LocationLoadState({required this.locations});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocationErrorState extends LocationState {
  final String error;

  LocationErrorState({required this.error});

  @override
  List<Object?> get props => throw UnimplementedError();
}
