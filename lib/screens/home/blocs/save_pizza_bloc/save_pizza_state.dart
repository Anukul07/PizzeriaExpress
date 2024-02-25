part of 'save_pizza_bloc.dart';

sealed class SavePizzaState extends Equatable {
  const SavePizzaState();

  @override
  List<Object> get props => [];
}

class SavePizzaInitial extends SavePizzaState {}

class SavePizzaLoading extends SavePizzaState {}

class SavePizzaSuccess extends SavePizzaState {}

class SavePizzaFailure extends SavePizzaState {}
