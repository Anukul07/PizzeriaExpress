import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'save_pizza_event.dart';
part 'save_pizza_state.dart';

class SavePizzaBloc extends Bloc<SavePizzaEvent, SavePizzaState> {
  final PizzaRepo _pizzaRepo;
  SavePizzaBloc(this._pizzaRepo) : super(SavePizzaInitial());

  Stream<SavePizzaState> mapEventToState(SavePizzaEvent event) async* {
    if (event is SavePizza) {
      yield* _mapSavePizzaToState(event);
    }
  }

  Stream<SavePizzaState> _mapSavePizzaToState(SavePizza event) async* {
    yield SavePizzaLoading();
    try {
      await _pizzaRepo.savePizza(event.pizza);
      yield SavePizzaSuccess();
    } catch (_) {
      yield SavePizzaFailure();
    }
  }
}
