import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_view_event.dart';
part 'page_view_state.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  PageViewBloc() : super(const PageChanged(0)) {
    on<ChangePage>((event, emit) {
      emit(PageChanged(event.index));
    });
  }
}
