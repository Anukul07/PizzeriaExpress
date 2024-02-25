import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'delete_pizza_event.dart';
part 'delete_pizza_state.dart';

class DeletePizzaBloc extends Bloc<DeletePizzaEvent, DeletePizzaState> {
  final PizzaRepo pizzaRepo;

  DeletePizzaBloc(this.pizzaRepo) : super(DeletePizzaInitial());

  Stream<DeletePizzaState> mapEventToState(DeletePizzaEvent event) async* {
    if (event is DeletePizzaRequested) {
      yield* _mapDeletePizzaRequestedToState(event);
    }
  }

  Stream<DeletePizzaState> _mapDeletePizzaRequestedToState(
      DeletePizzaRequested event) async* {
    yield DeletePizzaLoading();
    try {
      await pizzaRepo.deletePizza(event.pizzaId);
      yield DeletePizzaSuccess();
    } catch (_) {
      yield DeletePizzaFailure();
    }
  }
}
