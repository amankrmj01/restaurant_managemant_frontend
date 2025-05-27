part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {}

class PageLoaded extends PageState {
  final Widget page;

  const PageLoaded(this.page);

  @override
  List<Object> get props => [page];
}
