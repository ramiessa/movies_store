import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Movies_store/categories_model.dart';
import '../../models/Movies_store/movie_model.dart';
import '../../modules/Categories/Categorie_screen.dart';
import '../../modules/WhachList/WatchList.dart';
import '../../modules/profile/profile.dart';
import '../constant/constants.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    CategoriesScreen(),
    WatchList(),
    Profile(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  dynamic categoriesdata;

  void get_categories() {
    emit(LoadingCategoriesState());
    fetchData(url: Categoriesurl).then((value) {
      print("ramie");
      categoriesdata = CategoriesModel.fromJson(value);
      print(categoriesdata!.categories[2].title);
      emit(SuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }

  dynamic movies_data;

  void get_Movies() {
    emit(LoadingMovieState());
    fetchData(url: moviesurl).then((value) {
      print("ramie");
      movies_data = MoviesModel.fromJson(value);
      print(movies_data.Movies[0].title);
      emit(SuccessMovieState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMovieState());
    });
  }

  List<dynamic> type_movies_data = [];

  void get_type_Movies({required int index}) {
    emit(LoadingTypeOfMovieState());
    movies_data.Movies.forEach((element) {
      if (element.categoryId == index) type_movies_data.add(element);
      emit(SuccessTypeOfMovieState());
    });
  }
}
