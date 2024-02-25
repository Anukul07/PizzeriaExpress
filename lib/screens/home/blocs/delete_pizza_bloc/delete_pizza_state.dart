part of 'delete_pizza_bloc.dart';

sealed class DeletePizzaState extends Equatable {
  const DeletePizzaState();

  @override
  List<Object> get props => [];
}

class DeletePizzaInitial extends DeletePizzaState {}

class DeletePizzaLoading extends DeletePizzaState {}

class DeletePizzaSuccess extends DeletePizzaState {}

class DeletePizzaFailure extends DeletePizzaState {}
