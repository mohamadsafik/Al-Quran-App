import 'package:tests/repository.dart';
import 'package:tests/location_state.dart';
import 'package:tests/location_event.dart';
import 'package:bloc/bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final locationRepository = LocationRepository();

  LocationBloc() : super(LocationLoadingState()) {
    on<LocationEvent>((event, emit) async {
      if (event is LocationLoadEvent) {
        emit(LocationLoadingState());
      }
      try {
        final locations = await locationRepository.getLocation();
        emit(LocationLoadState(locations: locations));
      } catch (e) {
        emit(LocationErrorState(error: e.toString()));
      }
    });
  }
}
