part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

abstract class CategoryActionState extends CategoryState {}

class CatagorySuccessState extends CategoryState {
  final List<CategoryModel> catagories;

  CatagorySuccessState({required this.catagories});
}
