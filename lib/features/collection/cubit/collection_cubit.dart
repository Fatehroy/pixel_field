import 'package:bloc/bloc.dart';
import '../repository/collection_repository.dart';
import 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionRepository repository;

  CollectionCubit(this.repository) : super(const CollectionState.initial());

  Future<void> fetchCars() async {
    try {
      emit(const CollectionState.loading());
      final carDetails = await repository.fetchCars();
      emit(CollectionState.loaded(carDetails));
    } catch (e) {
      emit(CollectionState.error(e.toString()));
    }
  }
}
