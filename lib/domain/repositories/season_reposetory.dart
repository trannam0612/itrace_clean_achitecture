import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/season_entity.dart';

abstract class SeasonRepository {
  Future<DataState<List<SeaSonEntity>>> getListSeasons({
    required String companyId,
  });
}
