import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              builder: ((context) => Body()),
            ),
          );
        });
  }
}

Widget Body() {
  return Center(
      child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ));
}
