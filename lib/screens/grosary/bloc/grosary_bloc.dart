import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/data/cart_item.dart';
import 'package:shoping_app/data/favorite_fruits.dart';
import 'package:shoping_app/data/fruits.dart';
import 'package:shoping_app/models/fruits_model.dart';

part 'grosary_event.dart';
part 'grosary_state.dart';

class GrosaryBloc extends Bloc<GrosaryEvent, GrosaryState> {
  GrosaryBloc() : super(GrosaryInitialState()) {
    on<InitialLoadEvent>(initialLoadEvent);
    on<ProductWishListNavigationEvent>(productWishListNavigationEvent);
    on<ProductCartListNavigationEvent>(productCartListNavigationEvent);
    on<ProductWishItemClickedEvent>(productWishItemClickedEvent);
    on<ProductAddToCartClickEvent>(productAddToCartClickEvent);
    on<ProductAddCountClickEvent>(productAddCountClickEvent);
    on<ProductRemoveCountClickEvent>(productRemoveCountClickEvent);
  }

  FutureOr<void> initialLoadEvent(
      InitialLoadEvent event, Emitter<GrosaryState> emit) async {
    emit(GrosaryInitialState());
    await Future.delayed(const Duration(seconds: 2));
    emit(GrosarySuccessState(
        fruits: Fruits.fruits.map((e) => FruitsModel.fromJson(e)).toList()));
  }

  FutureOr<void> productWishListNavigationEvent(
      ProductWishListNavigationEvent event, Emitter<GrosaryState> emit) {
    emit(ProductFavoriteNavigationState());
  }

  FutureOr<void> productCartListNavigationEvent(
      ProductCartListNavigationEvent event, Emitter<GrosaryState> emit) {
    emit(ProductCartNavigationState());
  }

  FutureOr<void> productWishItemClickedEvent(
      ProductWishItemClickedEvent event, Emitter<GrosaryState> emit) {
    favoritList.add(event.item);
    emit(ProductItemFavoriteClickedState());
  }

  FutureOr<void> productAddToCartClickEvent(
      ProductAddToCartClickEvent event, Emitter<GrosaryState> emit) {
    cartItemList.add(event.item);
    emit(ProductItemAddToCartClickedState());
  }

  FutureOr<void> productAddCountClickEvent(
      ProductAddCountClickEvent event, Emitter<GrosaryState> emit) {}

  FutureOr<void> productRemoveCountClickEvent(
      ProductRemoveCountClickEvent event, Emitter<GrosaryState> emit) {}
}
