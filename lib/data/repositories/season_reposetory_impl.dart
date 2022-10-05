import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/data/datasource/remote/data_source/season_data_source.dart';
import 'package:itrace_247/data/datasource/remote/data_source/user_data_source.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_infor_user_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_list_season_response.dart';
import 'package:itrace_247/data/models/season_model.dart';
import 'package:itrace_247/data/models/user_model.dart';
import 'package:itrace_247/domain/entities/season_entity.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/domain/repositories/season_reposetory.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:retrofit/dio.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  SeasonRepositoryImpl(this._seasonDataSource);
  final SeasonDataSource _seasonDataSource;

  @override
  Future<DataState<List<SeasonModel>>> getListSeasons({
    required String companyId,
  }) async {
    try {
      final HttpResponse<GetListSeasonsResponse> result =
          await _seasonDataSource.getListSeasons(companyId: companyId);
      if (result.response.statusCode == HttpStatus.ok) {
        List<SeasonModel> listSeaSons = <SeasonModel>[];
        final List<SeasonItem> listSeasonsResponse = result.data.data ?? [];
        for (SeasonItem element in listSeasonsResponse) {
          listSeaSons.add(
            SeasonModel(
              element.id,
              element.name,
              element.status,
              element.companyId,
              element.description,
              element.createdAt,
              element.updatedAt,
              element.deletedAt,
            ),
          );
        }

        return DataSuccess(listSeaSons);
      } else {
        return DataFailed(
          DioError(
            error: result.response.statusMessage,
            type: DioErrorType.response,
            response: result.response,
            requestOptions: result.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
