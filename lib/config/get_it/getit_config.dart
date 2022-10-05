import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:itrace_247/config/dio/dio_config.dart';
import 'package:itrace_247/config/env/app_env.dart';
import 'package:itrace_247/config/image_picker_config/image_picker_config.dart';
import 'package:itrace_247/config/shared_preferences/shared_preferences_sevice.dart';
// import 'package:itrace_247/config/network/base_api.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_sevice.dart';
import 'package:itrace_247/config/utils/validate.dart';
import 'package:itrace_247/data/datasource/remote/api/api.dart';
import 'package:itrace_247/data/datasource/remote/data_source/address_data_source.dart';
import 'package:itrace_247/data/datasource/remote/data_source/login_data_source.dart';
import 'package:itrace_247/data/datasource/remote/data_source/season_data_source.dart';
import 'package:itrace_247/data/datasource/remote/data_source/user_data_source.dart';
import 'package:itrace_247/data/datasource/remote/sevices/address_sevices.dart';
import 'package:itrace_247/data/datasource/remote/sevices/login_sevices.dart';
import 'package:itrace_247/data/datasource/remote/sevices/season_sevices.dart';
import 'package:itrace_247/data/datasource/remote/sevices/user_sevices.dart';
import 'package:itrace_247/data/repositories/address_reposetory_impl.dart';
import 'package:itrace_247/data/repositories/login_reposetory_impl.dart';
import 'package:itrace_247/data/repositories/season_reposetory_impl.dart';
import 'package:itrace_247/data/repositories/user_reposetory_impl.dart';
import 'package:itrace_247/domain/repositories/address_reponsetory.dart';
import 'package:itrace_247/domain/repositories/login_reposetory.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:itrace_247/domain/usecases/address_usecase.dart';
import 'package:itrace_247/domain/usecases/season_usecase.dart';
import 'package:itrace_247/domain/usecases/user_usecase.dart';
import 'package:itrace_247/presentation/bloc/app_bloc.dart';
import 'package:itrace_247/presentation/screen/account_information/bloc/account_information_bloc.dart';
import 'package:itrace_247/presentation/screen/individual/bloc/individual_bloc.dart';
import 'package:itrace_247/presentation/screen/list_season/bloc/list_season_bloc.dart';
import 'package:itrace_247/presentation/screen/login/bloc/login_bloc.dart';
import 'package:itrace_247/presentation/screen/select_address/bloc/address_bloc.dart';

import '../../domain/repositories/season_reposetory.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppEnvironment>(AppEnvironment());
  // Init get it for dio
  getIt.registerSingleton<StorageService>(StorageService());
  final SharedPreferences intance = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(intance);

  await DioConfig.initDi();

  final EnvConfig appConfig = getIt<AppEnvironment>().getConfig();
  getIt.registerSingleton<AppImagePicker>(AppImagePicker());

  getIt.registerSingleton<LocalStorageService>(
    LocalStorageService(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<Api>(
    () => Api(
      getIt<Dio>(),
      baseUrl: appConfig.networkConfig.rhBaseUrl,
    ),
  );
  getIt.registerLazySingleton<ValidateCustom>(
    () => ValidateCustom(),
  );

  getIt.registerSingleton<AppBloc>(
    AppBloc(
      getIt(),
    ),
  );
//login
  getIt.registerFactory<LoginRepository>(() => LoginRepositoryImpl(getIt()));
  getIt.registerFactory<LoginServices>(() => LoginServices(getIt()));

  getIt.registerFactory<LoginDataSource>(() => LoginDataSource(getIt()));
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      getIt(),
      getIt(),
    ),
  );
  //user
  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl(getIt()));
  getIt.registerFactory<UserServices>(() => UserServices(getIt()));

  getIt.registerFactory<UserDataSource>(() => UserDataSource(getIt()));
  getIt.registerFactory<UserUsecase>(() => UserUsecase(getIt()));

  getIt.registerFactory<IndividualBloc>(
    () => IndividualBloc(
      getIt(),
    ),
  );
  getIt.registerFactory<AccountInformationBloc>(
    () => AccountInformationBloc(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  //season
  getIt.registerFactory<SeasonRepository>(() => SeasonRepositoryImpl(getIt()));
  getIt.registerFactory<SeasonServices>(() => SeasonServices(getIt()));

  getIt.registerFactory<SeasonDataSource>(() => SeasonDataSource(getIt()));
  getIt.registerFactory<SeasonUsecase>(() => SeasonUsecase(getIt()));
  getIt.registerFactory<ListSeasonBloc>(
    () => ListSeasonBloc(
      getIt(),
    ),
  );

  //address
  getIt
      .registerFactory<AddressRepository>(() => AddressRepositoryImpl(getIt()));
  getIt.registerFactory<AddressServices>(() => AddressServices(getIt()));

  getIt.registerFactory<AddressDataSource>(() => AddressDataSource(getIt()));
  getIt.registerFactory<AddressUseCase>(() => AddressUseCase(getIt()));
  getIt.registerFactory<AddressBloc>(
    () => AddressBloc(
      getIt(),
    ),
  );
}
