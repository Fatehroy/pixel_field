import 'package:get_it/get_it.dart';
import 'package:pixel_field/core/router/router.dart';

import '../../features/collection_details/cubit/collection_details_cubit.dart';
import '../../features/collection_details/repository/collection_details_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Router
  sl.registerLazySingleton(() => AppRouter());

  sl.registerLazySingleton(() => CollectionDetailsRepository());

  // Cubits
  sl.registerLazySingleton(() => CollectionDetailsCubit(sl()));
}
