import 'package:get_it/get_it.dart';
import 'package:pixel_field/core/router/router.dart';

import '../../features/collection/cubit/collection_cubit.dart';
import '../../features/collection/repository/collection_repository.dart';
import '../../features/collection_details/cubit/collection_details_cubit.dart';
import '../../features/collection_details/repository/collection_details_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Router
  sl.registerLazySingleton(() => AppRouter());

  // Repos
  sl.registerLazySingleton(() => CollectionDetailsRepository());
  sl.registerLazySingleton(() => CollectionRepository());

  // Cubits
  sl.registerLazySingleton(() => CollectionDetailsCubit(sl()));
  sl.registerLazySingleton(() => CollectionCubit(sl()));
}
