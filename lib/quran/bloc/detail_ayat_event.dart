abstract class AyatEvent {
  const AyatEvent();
}

class AyatLoadedEvent extends AyatEvent {
  String? urlID;
  AyatLoadedEvent({required this.urlID});
  @override
  List<Object> get props => [];
}
