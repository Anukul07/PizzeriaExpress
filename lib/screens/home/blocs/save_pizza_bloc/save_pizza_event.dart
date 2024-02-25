part of 'save_pizza_bloc.dart';

sealed class SavePizzaEvent extends Equatable {
  const SavePizzaEvent();

  @override
  List<Object> get props => [];
}

class SavePizza extends SavePizzaEvent {
  final Pizza pizza;

  const SavePizza(this.pizza);

  @override
  List<Object> get props => [pizza];
}
