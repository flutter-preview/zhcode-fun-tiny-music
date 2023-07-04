import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_albums_state.dart';

class RandomAlbumsCubit extends Cubit<RandomAlbumsState> {
  RandomAlbumsCubit() : super(RandomAlbumsInitial());
}
