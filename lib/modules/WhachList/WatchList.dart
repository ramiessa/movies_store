import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_store/shared/components/components.dart';
import 'package:movies_store/shared/styles/colors.dart';

import '../../models/Movies_store/categories_model.dart';
import '../../models/Movies_store/movie_model.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';
import '../Movie_Details/movie_details.dart';

class WatchList extends StatelessWidget {
  WatchList({
    super.key,
  });
  bool isempty = true;
  int count = 0;

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
                condition: AppCubit.get(context).choosenMovieData != null,
                fallback: ((context) => const Center(
                      child: Text(
                        'No Movies In Watch List ',
                        style: TextStyle(color: defaultColor, fontSize: 25),
                      ),
                    )),
                builder: ((context) =>
                    builder_screen(AppCubit.get(context).Watchlist, context)),
              ));
        });
  }

  Widget builder_screen(List<dynamic> Model, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defualtSearchBox(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'WatchList',
                style: const TextStyle(
                  color: Color.fromARGB(255, 241, 94, 83),
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                        child: item(Model[index], context),
                        onTap: (() {
                          AppCubit.get(context).chageChoosenMovie(Model[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      movie: Model[index],
                                    )),
                          );
                        }),
                      ),
                  // Model.movies[index].categoryId ==
                  //         AppCubit.get(context).category_id! + 1
                  //     ? GestureDetector(
                  //         child: item(Model.movies[index], context),
                  //         onTap: (() => print(index)))
                  //     : const SizedBox.shrink(),
                  separatorBuilder: ((context, index) => SizedBox(height: 10)),
                  itemCount: Model.length),
            ],
          ),
        ),
      ),
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
              // color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://darsoft.b-cdn.net/assets/movies/${model.id}.jpg',
                fit: BoxFit.cover,
              ),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        model.year,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            model.rating.toString() + '/10',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
