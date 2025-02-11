import 'package:get_it/get_it.dart';
import 'package:pixel_field/core/router/router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Router
  sl.registerLazySingleton(() => AppRouter());

  // // Cubits
  // sl.registerLazySingleton(() => TimerCubit());
  // sl.registerLazySingleton(() => TrackerCubit(sl()));
}
