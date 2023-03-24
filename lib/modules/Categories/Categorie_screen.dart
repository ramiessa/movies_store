import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Movies_store/categories_model.dart';
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
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                              onTap: () {},
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Center(
                                  child: Text(model.categories[index].title),
                                ),
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
