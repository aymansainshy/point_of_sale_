import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/models/category.dart';
import 'package:pos/repositories/categories_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this.categoriesRepository) : super(CategoriesInitial());

  final CategoriesRepository categoriesRepository;

  List<Category> _categories = [];

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is FetchCategories) {
      try {
        _categories =  categoriesRepository.fetchCategories();
        yield CategoriesSuccess(_categories);
      } catch (e) {
        print("Something happened in setting up or sending the request that triggered an Error");
        yield CategoriesFailure(e.toString());
      }
    }
  }
}
