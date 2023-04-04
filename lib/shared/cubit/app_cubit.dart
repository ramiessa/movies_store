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
  // category_id changing
  int? category_id;

  List<dynamic> Watchlist = [];
  List<String> typesOfMovies = [
    'Animation',
    'Action',
    'Drama',
    'Comedy',
    'Horror',
    'Science Fiction',
    'Romance',
    'Thriller',
    'Arabic',
    'Musical',
    'Documentation',
    'Others'
  ];
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
      emit(SuccessCategoriesState());
      categoriesdata = CategoriesModel.fromJson(value);
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }

  MoviesModel movies_data = MoviesModel();

  List<dynamic>? filteredMovies = [];

  void get_Movies() {
    emit(LoadingMovieState());
    fetchData(url: moviesurl).then((value) {
      emit(SuccessMovieState());
      movies_data = MoviesModel.fromJson(value);
    }).catchError((error) {
      emit(ErrorMovieState());
    });
  }

  void changeCategoryId(int index) {
    category_id = index;

    emit(ChangeCategoryId());
  }

  dynamic choosenMovieData;
  void chageChoosenMovie(dynamic choosenMove) {
    choosenMovieData = choosenMove;
    emit(ChangeChoosenMovie());
  }

  void add_to_watchlist(dynamic movie) {
    if (Watchlist.contains(movie) != true) {
      Watchlist.add(movie);
    }

    emit(AddMovieToWatchList());
  }

  dynamic image;

  void getImage(dynamic url) {
    fetchimage(url).then((response) {
      if (response.statusCode == 200) {
        emit(SuccessLoadImage());
        // If the call to the server was successful, parse the JSON.
        image = response.body;
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
