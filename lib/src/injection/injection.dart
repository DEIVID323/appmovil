import 'package:get_it/get_it.dart';
import 'package:jdphotomap/src/features/app/data/datasource/app_datasource.dart';
import 'package:jdphotomap/src/features/app/data/repository/app_repository_impl.dart';
import 'package:jdphotomap/src/features/app/domain/repository/app_repository.dart';
import 'package:jdphotomap/src/features/app/domain/usecase/app_usecase.dart';
import 'package:jdphotomap/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:jdphotomap/src/features/login/data/datasource/login_datasource.dart';
import 'package:jdphotomap/src/features/login/data/repository/login_repository_impl.dart';
import 'package:jdphotomap/src/features/login/domain/repository/login_respository.dart';
import 'package:jdphotomap/src/features/login/domain/usecase/login_usecase.dart';
import 'package:jdphotomap/src/features/login/presentation/cubit/login_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //datasources
  sl.registerLazySingleton<AppDatasource>(() => IAppDatasource());
  sl.registerLazySingleton<LoginDatasource>(() => ILoginDatasource());

  //repositories
  sl.registerLazySingleton<AppRepository>(
    () => IAppRepository(datasource: sl<AppDatasource>()),
  );
  sl.registerLazySingleton<LoginRepository>(
    () => ILoginRepository(datasource: sl<LoginDatasource>()),
  );

  //usecase
  sl.registerLazySingleton<AppUsecase>(
    () => AppUsecase(appRepository: sl<AppRepository>()),
  );
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(loginRepository: sl<LoginRepository>()),
  );

  //cubits
  sl.registerLazySingleton<AppCubit>(() => AppCubit(usecase: sl<AppUsecase>()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(usecase: sl<LoginUsecase>()));
}
