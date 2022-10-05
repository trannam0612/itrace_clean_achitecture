import 'package:dio/dio.dart';

abstract class DataState<T> {
  const DataState({this.data, this.error});

  final T? data;
  final DioError? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError? error, {T? data})
      : super(
          error: error,
          data: data,
        );
}

extension DataStateExtensions<T> on DataState<T> {
  bool isSuccess() => this is DataSuccess;
  bool isError() => this is DataFailed;
}
