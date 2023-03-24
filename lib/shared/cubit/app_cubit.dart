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
      print("get_categories");
      categoriesdata = CategoriesModel.fromJson(value);

      emit(SuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }

  MoviesModel movies_data = MoviesModel();

  void get_Movies() {
    emit(LoadingMovieState());
    fetchData(url: moviesurl).then((value) {
      print("get_Movies");
      movies_data = MoviesModel.fromJson(value);

      emit(SuccessMovieState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMovieState());
    });
  }

  List<dynamic> drama_movies_data = [];
  void get_spicial() {
    for (var i = 0; i < movies_data.Movies.length; i++) {
      // TO DO
      if (movies_data.Movies[i].categoryId == 3) {
        drama_movies_data.add(movies_data.Movies[i]);
      }
      print(drama_movies_data[1]);
    }
  }
}
