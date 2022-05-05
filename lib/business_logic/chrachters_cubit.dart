import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chrachters_state.dart';

class ChrachtersCubit extends Cubit<ChrachtersState> {
  ChrachtersCubit() : super(ChrachtersInitial());
}
