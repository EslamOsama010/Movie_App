import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:training/screens/movie/model.dart';

import 'states.dart';

class MovieController extends Cubit<MovieStates> {
  MovieController() : super(MovieInitialState());

  static MovieController get(context) => BlocProvider.of(context);
  List<Results>? movies = [];
  List<Results>? newMovies = [];
  var refreshController = RefreshController();

  getData() async {
    newMovies!.clear();
    var response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber');
    MovieModel model = MovieModel.fromJson(response.data);
    newMovies = model.results;
    movies!.addAll(newMovies!);
    emit(GetMoviesSuccessState());
  }

  refresh() {
    pageNumber = 1;
    movies!.clear();
    getData();
    refreshController.refreshCompleted();
    emit(GetMoviesRefreshState());
  }

  var pageNumber = 1;
  loading() {
    pageNumber++;
    getData();
    refreshController.loadComplete();
    emit(GetMoviesLoadingState());
  }
}
