part of 'list_season_bloc.dart';

class ListSeasonState {
  ListSeasonState({this.getListSeasonState, this.listSeasons});

  final LoadState? getListSeasonState;
  final List<SeaSonEntity>? listSeasons;
  ListSeasonState copyWith({
    LoadState? getListSeasonState,
    List<SeaSonEntity>? listSeasons,
  }) {
    return ListSeasonState(
      getListSeasonState: getListSeasonState ?? this.getListSeasonState,
      listSeasons: listSeasons ?? this.listSeasons,
    );
  }

  ListSeasonState clearState() {
    return ListSeasonState();
  }
}
