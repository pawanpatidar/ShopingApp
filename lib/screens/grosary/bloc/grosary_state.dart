part of 'grosary_bloc.dart';

@immutable
sealed class GrosaryState {}

final class GrosaryInitialState extends GrosaryState {}

abstract class GrosaryActionState extends GrosaryState {}

class GrosarySuccessState extends GrosaryState {
  final List<FruitsModel> fruits;

  GrosarySuccessState({required this.fruits});
}

class GrosaryErrorState extends GrosaryState {}

class ProductItemFavoriteClickedState extends GrosaryActionState {}

class ProductItemAddToCartClickedState extends GrosaryActionState {}

class ProductFavoriteNavigationState extends GrosaryActionState {}

class ProductCartNavigationState extends GrosaryActionState {}
