import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_collection_state.dart';

class RandomCollectionCubit extends Cubit<RandomCollectionState> {
  RandomCollectionCubit() : super(RandomCollectionInitial());
}
