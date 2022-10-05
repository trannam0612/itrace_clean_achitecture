import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<DataState<LoginEntity>> login({
    String pinCode,
  });
}
