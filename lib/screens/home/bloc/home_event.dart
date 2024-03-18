// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class InitialLoadEvent extends HomeEvent {}

class ProductWishListNavigationEvent extends HomeEvent {}

class ProductCartListNavigationEvent extends HomeEvent {}

class ProductWishItemClickedEvent extends HomeEvent {
  FruitsModel item;
  ProductWishItemClickedEvent({
    required this.item,
  });
}

class ProductAddToCartClickEvent extends HomeEvent {
  FruitsModel item;
  ProductAddToCartClickEvent({
    required this.item,
  });
}

class ProductAddCountClickEvent extends HomeEvent {}

class ProductRemoveCountClickEvent extends HomeEvent {}
