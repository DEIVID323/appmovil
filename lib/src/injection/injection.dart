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
import 'package:jdphotomap/src/features/signup/data/datasource/signup_datasource.dart';
import 'package:jdphotomap/src/features/signup/data/repository/signup_repository_impl.dart';
import 'package:jdphotomap/src/features/signup/domain/repository/signup_repository.dart';
import 'package:jdphotomap/src/features/signup/domain/usecase/signup_usecase.dart';
import 'package:jdphotomap/src/features/signup/presentation/cubit/signup_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //datasources
  sl.registerLazySingleton<AppDatasource>(() => IAppDatasource());
  sl.registerLazySingleton<LoginDatasource>(() => ILoginDatasource());
  sl.registerLazySingleton<SignupDatasource>(() => ISignupDatasource());

  //repositories
  sl.registerLazySingleton<AppRepository>(
    () => IAppRepository(datasource: sl<AppDatasource>()),
  );
  sl.registerLazySingleton<LoginRepository>(
    () => ILoginRepository(datasource: sl<LoginDatasource>()),
  );
  sl.registerLazySingleton<SignupRepository>(
    () => ISignupRepository(datasource: sl<SignupDatasource>()),
  );
  //usecase
  sl.registerLazySingleton<AppUsecase>(
    () => AppUsecase(appRepository: sl<AppRepository>()),
  );
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(loginRepository: sl<LoginRepository>()),
  );
  sl.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(repository: sl<SignupRepository>()),
  );

  //cubits
  sl.registerLazySingleton<AppCubit>(() => AppCubit(usecase: sl<AppUsecase>()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(usecase: sl<LoginUsecase>()));
  sl.registerFactory<SignupCubit>(
    () => SignupCubit(usecase: sl<SignupUsecase>()),
  );
}
