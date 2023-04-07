import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_store/models/Movies_store/categories_model.dart';
import 'package:movies_store/shared/styles/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId:
                    AppCubit.get(context).choosenMovieData.youtube_video_id,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(AppCubit.get(context).choosenMovieData.title),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // some widgets

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: player,
                        ),
                        //some other widgets
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Container(
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
                                        'https://darsoft.b-cdn.net/assets/movies/${AppCubit.get(context).choosenMovieData.id}.jpg',
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
                                          color: const Color.fromARGB(
                                              255, 87, 83, 83),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                AppCubit.get(context)
                                                    .choosenMovieData
                                                    .title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    AppCubit.get(context)
                                                        .choosenMovieData
                                                        .year,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    AppCubit.get(context)
                                                            .choosenMovieData
                                                            .rating
                                                            .toString() +
                                                        '/10',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: 150,
                                                height: 25,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    AppCubit.get(context)
                                                        .add_to_watchlist(AppCubit
                                                                .get(context)
                                                            .choosenMovieData);
                                                  },
                                                  child: const Text(
                                                    'Add to Watchlist',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Summary ',
                          style: TextStyle(
                            color: bolodfontColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppCubit.get(context).choosenMovieData.summary,
                          style: TextStyle(
                            color: bolodfontColor,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Director:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              AppCubit.get(context).choosenMovieData.director,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Text(
                                'Writers:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Row(
                                  children: List.generate(
                                      AppCubit.get(context)
                                          .choosenMovieData
                                          .writers
                                          .length,
                                      (index) => Text(
                                            AppCubit.get(context)
                                                    .choosenMovieData
                                                    .writers[index] +
                                                '-',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ))),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Cast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  AppCubit.get(context)
                                      .choosenMovieData
                                      .actors
                                      .length,
                                  (index) => rowItem(AppCubit.get(context)
                                      .choosenMovieData
                                      .actors[index]))),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  Widget rowItem(dynamic model) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://darsoft.b-cdn.net/assets/artists/${model.id}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(model.name),
      ],
    );
  }
}
