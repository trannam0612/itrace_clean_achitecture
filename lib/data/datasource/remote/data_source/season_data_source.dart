import 'package:itrace_247/data/datasource/remote/models/responses/get_list_season_response.dart';
import 'package:itrace_247/data/datasource/remote/sevices/season_sevices.dart';
import 'package:retrofit/retrofit.dart';

class SeasonDataSource {
  SeasonDataSource(this._seasonServices);
  final SeasonServices _seasonServices;

  Future<HttpResponse<GetListSeasonsResponse>> getListSeasons({
    required String companyId,
  }) {
    return _seasonServices.getListSeasons(companyId: companyId);
  }
}
