import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommend_state.dart';

class RecommendCubit extends Cubit<RecommendState> {
  RecommendCubit() : super(RecommendInitial());
}
