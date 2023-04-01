import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Movies_store/categories_model.dart';
import '../../models/Movies_store/movie_model.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class ListMovisScreenOnIndex extends StatelessWidget {
  ListMovisScreenOnIndex({
    super.key,
  });
  bool isempty = true;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          dynamic i;
          for (i = 0;
              i < AppCubit.get(context).movies_data.movies.length;
              i++) {
            if (AppCubit.get(context).movies_data.movies[i].categoryId ==
                AppCubit.get(context).category_id) {
              count += 1;
            }
          }
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none))
                ],
                title: Center(child: const Text('Movies Store')),
              ),
              body: ConditionalBuilder(
                condition:
                    AppCubit.get(context).movies_data != null && count > 0,
                fallback: ((context) => const Text('commen soon')),
                builder: ((context) =>
                    builder_screen(AppCubit.get(context).movies_data, context)),
              ));
        });
  }

  Widget builder_screen(MoviesModel Model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ListView.separated(
              itemBuilder: (context, index) => Model.movies[index].categoryId ==
                      AppCubit.get(context).category_id
                  ? item(Model.movies[index], context)
                  : SizedBox.shrink(),
              separatorBuilder: ((context, index) => SizedBox(height: 3)),
              itemCount: Model.movies.length)),
    );
  }

  Widget item(dynamic model, BuildContext context) {
    isempty = true;
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 87, 83, 83),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(model.title)),
          ),
        ],
      ),
    );
  }
}
