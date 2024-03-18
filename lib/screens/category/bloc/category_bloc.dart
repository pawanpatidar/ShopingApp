import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/data/category_data.dart';
import 'package:shoping_app/models/calegory_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<InitialLoadCategoryEvent>(initialLoadCategoryEvent);
  }

  FutureOr<void> initialLoadCategoryEvent(
      InitialLoadCategoryEvent event, Emitter<CategoryState> emit) {
    emit(CategoryInitial());
    emit(CatagorySuccessState(
        catagories: ItemCategory.categoryList
            .map((e) => CategoryModel.fromJson(e))
            .toList()));
  }
}
