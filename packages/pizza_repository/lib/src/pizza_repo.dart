import 'models/models.dart';

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();
  Future<void> savePizza(Pizza pizza);
  Future<void> deletePizza(String pizzaId);
}
