// @immutable
abstract class LocationEvent {
  const LocationEvent();
}

class LocationLoadEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}
