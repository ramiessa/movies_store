import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_store/modules/list_of_movies_screen/list_of_movies_screen.dart';

import '../../models/Movies_store/categories_model.dart';
import '../../models/Movies_store/movie_model.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                condition: AppCubit.get(context).categoriesdata != null,
                fallback: ((context) =>
                    const Center(child: CircularProgressIndicator())),
                builder: ((context) =>
                    Body(AppCubit.get(context).categoriesdata, context)),
              ));
        });
  }

  Widget Body(CategoriesModel model, BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defualtSearchBox(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Trending Categories',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    model.categories.length,
                    (index) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppCubit.get(context).changeCategoryId(index);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ListMovisScreenOnIndex(),
                                  ),
                                );
                              },
                              child: defualtContainer(
                                text: model.categories[index].title,
                              ),
                            ),
                          ],
                        )))
          ],
        ),
      ),
    ));
  }
}
