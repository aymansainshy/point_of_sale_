part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesInProgress extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesFailure extends CategoriesState {
  final String error;

  CategoriesFailure(this.error);
}
