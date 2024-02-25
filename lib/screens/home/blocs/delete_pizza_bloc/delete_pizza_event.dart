part of 'delete_pizza_bloc.dart';

sealed class DeletePizzaEvent extends Equatable {
  const DeletePizzaEvent();

  @override
  List<Object?> get props => [];
}

class DeletePizzaRequested extends DeletePizzaEvent {
  final String pizzaId;

  const DeletePizzaRequested(this.pizzaId);

  @override
  List<Object?> get props => [pizzaId];
}
