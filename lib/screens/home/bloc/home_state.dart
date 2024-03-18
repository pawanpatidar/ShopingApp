part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<FruitsModel> fruits;

  HomeSuccessState({required this.fruits});
}

class HomeErrorState extends HomeState {}

class ProductItemFavoriteClickedState extends HomeActionState {}

class ProductItemAddToCartClickedState extends HomeActionState {}

class ProductFavoriteNavigationState extends HomeActionState {}

class ProductCartNavigationState extends HomeActionState {}
