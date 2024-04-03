class HomeState {}

class HomeInitState extends HomeState {}

class HomeGetSourcesLoadingState extends HomeState {}

class HomeGetSourcesSuccessState extends HomeState {}

class HomeGetSourcesErrorState extends HomeState {
  String errorMessage;
  HomeGetSourcesErrorState(this.errorMessage);
}

class HomeGetNewsLoadingState extends HomeState {}

class HomeGetNewsSuccessState extends HomeState {}

class HomeGetNewsErrorState extends HomeState {
  String errorMessage;
  HomeGetNewsErrorState(this.errorMessage);
}

class ChangeSelectedSource extends HomeState {}
