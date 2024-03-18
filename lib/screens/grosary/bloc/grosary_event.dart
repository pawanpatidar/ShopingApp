part of 'grosary_bloc.dart';

@immutable
sealed class GrosaryEvent {}

class InitialLoadEvent extends GrosaryEvent {}

class ProductWishListNavigationEvent extends GrosaryEvent {}

class ProductCartListNavigationEvent extends GrosaryEvent {}

class ProductWishItemClickedEvent extends GrosaryEvent {
  FruitsModel item;
  ProductWishItemClickedEvent({
    required this.item,
  });
}

class ProductAddToCartClickEvent extends GrosaryEvent {
  FruitsModel item;
  ProductAddToCartClickEvent({
    required this.item,
  });
}

class ProductAddCountClickEvent extends GrosaryEvent {}

class ProductRemoveCountClickEvent extends GrosaryEvent {}
