import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/car_details_model.dart';

part 'collection_details_state.freezed.dart';

@freezed
class CollectionDetailsState with _$CollectionDetailsState {
  const factory CollectionDetailsState.initial() = _Initial;
  const factory CollectionDetailsState.loading() = _Loading;
  const factory CollectionDetailsState.loaded(CarDetailsModel carDetails) = _Loaded;
  const factory CollectionDetailsState.error(String message) = _Error;
}
