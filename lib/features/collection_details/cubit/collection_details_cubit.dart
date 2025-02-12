import 'package:bloc/bloc.dart';
import '../repository/collection_details_repository.dart';
import 'collection_details_state.dart';

class CollectionDetailsCubit extends Cubit<CollectionDetailsState> {
  final CollectionDetailsRepository repository;

  CollectionDetailsCubit(this.repository) : super(const CollectionDetailsState.initial());

  Future<void> fetchCollectionDetails(String carId) async {
    try {
      print("Fetching");
      emit(const CollectionDetailsState.loading());
      final carDetails = await repository.fetchCarDetailsById(carId);
      emit(CollectionDetailsState.loaded(carDetails));
      print("Fetching done");
    } catch (e) {
      emit(CollectionDetailsState.error(e.toString()));
    }
  }
}
