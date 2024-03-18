import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/data/cart_item.dart';
import 'package:shoping_app/data/favorite_fruits.dart';
import 'package:shoping_app/data/fruits.dart';
import 'package:shoping_app/models/fruits_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitialLoadEvent>(initialLoadEvent);
    on<ProductWishListNavigationEvent>(productWishListNavigationEvent);
    on<ProductCartListNavigationEvent>(productCartListNavigationEvent);
    on<ProductWishItemClickedEvent>(productWishItemClickedEvent);
    on<ProductAddToCartClickEvent>(productAddToCartClickEvent);
    on<ProductAddCountClickEvent>(productAddCountClickEvent);
    on<ProductRemoveCountClickEvent>(productRemoveCountClickEvent);
  }

  FutureOr<void> initialLoadEvent(
      InitialLoadEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeSuccessState(
        fruits: Fruits.fruits.map((e) => FruitsModel.fromJson(e)).toList()));
  }

  FutureOr<void> productWishListNavigationEvent(
      ProductWishListNavigationEvent event, Emitter<HomeState> emit) {
    emit(ProductFavoriteNavigationState());
  }

  FutureOr<void> productCartListNavigationEvent(
      ProductCartListNavigationEvent event, Emitter<HomeState> emit) {
    emit(ProductCartNavigationState());
  }

  FutureOr<void> productWishItemClickedEvent(
      ProductWishItemClickedEvent event, Emitter<HomeState> emit) {
    favoritList.add(event.item);
    emit(ProductItemFavoriteClickedState());
  }

  FutureOr<void> productAddToCartClickEvent(
      ProductAddToCartClickEvent event, Emitter<HomeState> emit) {
    cartItemList.add(event.item);
    emit(ProductItemAddToCartClickedState());
  }

  FutureOr<void> productAddCountClickEvent(
      ProductAddCountClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> productRemoveCountClickEvent(
      ProductRemoveCountClickEvent event, Emitter<HomeState> emit) {}
}
