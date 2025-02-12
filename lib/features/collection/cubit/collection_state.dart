import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/car_model.dart';

part 'collection_state.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState.initial() = _Initial;
  const factory CollectionState.loading() = _Loading;
  const factory CollectionState.loaded(List<CarModel> cars) = _Loaded;
  const factory CollectionState.error(String message) = _Error;
}
