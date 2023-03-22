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
            body: ConditionalBuilder(
              condition: AppCubit.get(context).categoriesdata != null,
              fallback: ((context) =>
                  const Center(child: CircularProgressIndicator())),
              builder: ((context) => const Center(child: Text('Categories'))),
            ),
          );
        });
  }
}
