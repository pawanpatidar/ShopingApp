// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class ProductRemoveFromCartEvent extends CartEvent {
  FruitsModel item;
  ProductRemoveFromCartEvent({
    required this.item,
  });
}
