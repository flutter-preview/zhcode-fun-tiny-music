import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeChange(HomePage.recommend));

  void switchPage(int index) {
    emit(HomeChange(HomePage.values[index]));
  }
}
