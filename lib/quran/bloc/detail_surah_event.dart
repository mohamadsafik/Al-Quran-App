abstract class DetailSurahEvent {
  const DetailSurahEvent();
}

class DetailSurahLoadedEvent extends DetailSurahEvent {
  String? urlID;
  DetailSurahLoadedEvent({required this.urlID});
  @override
  List<Object> get props => [];
}
