part of 'page_view_bloc.dart';

abstract class PageViewEvent extends Equatable {
  const PageViewEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends PageViewEvent {
  final int index;

  const ChangePage(this.index);

  @override
  List<Object> get props => [];
}
