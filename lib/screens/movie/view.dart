import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:training/screens/movie/states.dart';
import 'package:training/screens/movie/widgets/item_grid.dart';

import 'controller.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieController()..getData(),
      child: BlocConsumer<MovieController, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = MovieController.get(context);
          return Scaffold(
            body: SmartRefresher(
              controller: controller.refreshController,
              enablePullUp: true,
              onLoading: controller.loading,
              onRefresh: controller.refresh,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(controller.movies!.length,
                    (index) => ItemGrid(controller.movies!, index)),
              ),
            ),
          );
        },
      ),
    );
  }
}
