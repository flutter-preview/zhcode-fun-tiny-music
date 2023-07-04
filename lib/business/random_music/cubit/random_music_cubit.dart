import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_music_state.dart';

class RandomMusicCubit extends Cubit<RandomMusicState> {
  RandomMusicCubit() : super(RandomMusicInitial());
}
