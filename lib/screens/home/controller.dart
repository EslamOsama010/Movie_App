import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class HomeController extends Cubit<HomeStates> {
  HomeController() : super(HomeInitialState());
  int x = 0;

  static HomeController get(context) => BlocProvider.of(context);
  void plus(){
    x++;
    emit(HomePlusState());
  }
  void minus(){
    if(x>0){
      x--;
    }
    emit(HomeMinusState());
  }
}
