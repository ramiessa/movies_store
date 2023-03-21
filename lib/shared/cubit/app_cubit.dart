import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/shop_app/categories_model.dart';
import '../../modules/Categories/Categories.dart';
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

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: "https://darsoft.b-cdn.net/movies_categories.json",
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel);
      emit(SuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }
}
