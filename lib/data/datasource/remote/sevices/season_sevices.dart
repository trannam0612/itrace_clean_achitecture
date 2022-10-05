import 'package:itrace_247/data/datasource/remote/api/api.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_list_season_response.dart';
import 'package:retrofit/retrofit.dart';

class SeasonServices {
  SeasonServices(this._api);
  final Api _api;

  Future<HttpResponse<GetListSeasonsResponse>> getListSeasons({
    required String companyId,
  }) {
    return _api.getListSeasons(companyId: companyId);
  }
}
