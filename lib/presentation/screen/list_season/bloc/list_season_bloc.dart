import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/season_entity.dart';
import 'package:itrace_247/domain/usecases/season_usecase.dart';
import 'package:meta/meta.dart';

part 'list_season_event.dart';
part 'list_season_state.dart';

class ListSeasonBloc extends Bloc<ListSeasonEvent, ListSeasonState> {
  ListSeasonBloc(this._seasonUsecase) : super(ListSeasonState()) {
    on<ListSeasonEvent>((ListSeasonEvent event, Emitter<ListSeasonState> emit) {
      // TODO: implement event handler
    });
    on<GetListSeasonEvent>(
      _handleGetListSeason,
    );
  }
  final SeasonUsecase _seasonUsecase;

  FutureOr<void> _handleGetListSeason(
    GetListSeasonEvent event,
    Emitter<ListSeasonState> emit,
  ) async {
    emit(state.copyWith(getListSeasonState: LoadState.loading));

    final DataState<List<SeaSonEntity>> data =
        await _seasonUsecase.getSeasonInfo(companyId: '1');
    if (data.isSuccess()) {
      emit(
        state.copyWith(
          getListSeasonState: LoadState.success,
          listSeasons: data.data,
        ),
      );
    } else {
      emit(state.copyWith(getListSeasonState: LoadState.failure));
    }
  }
}
