import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/core/usecases/usecase.dart';
import 'package:itrace_247/domain/entities/season_entity.dart';
import 'package:itrace_247/domain/repositories/season_reposetory.dart';

class SeasonUsecase {
  SeasonUsecase(this._seasonRepository);
  final SeasonRepository _seasonRepository;

  Future<DataState<List<SeaSonEntity>>> getSeasonInfo({
    required String companyId,
  }) {
    return _seasonRepository.getListSeasons(companyId: companyId);
  }
}
