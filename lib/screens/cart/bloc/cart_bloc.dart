import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/data/cart_item.dart';
import 'package:shoping_app/models/fruits_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<ProductRemoveFromCartEvent>(productRemoveFromCartEvent);
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> productRemoveFromCartEvent(
      ProductRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItemList.remove(event.item);
    emit(CartInitial());
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartInitial());
  }
}
