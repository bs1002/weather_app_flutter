part of 'page_view_bloc.dart';

abstract class PageViewState extends Equatable {
  const PageViewState();

  @override
  List<Object> get props => [];
}

class PageChanged extends PageViewState {
  final int index;

  const PageChanged(this.index);

  @override
  List<Object> get props => [index];
}
