import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/home/blocs/save_pizza_bloc/save_pizza_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';

class AddPizzaScreen extends StatelessWidget {
  const AddPizzaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pizza'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PizzaForm(),
      ),
    );
  }
}

class PizzaForm extends StatefulWidget {
  @override
  _PizzaFormState createState() => _PizzaFormState();
}

class _PizzaFormState extends State<PizzaForm> {
  final _formKey = GlobalKey<FormState>();
  late PizzaEntity _pizza;
  bool _isVeg = true;
  int _spicyLevel = 0;
  int _calories = 0;
  int _proteins = 0;
  int _fat = 0;
  int _carbs = 0;

  @override
  void initState() {
    super.initState();
    _pizza = PizzaEntity(
      pizzaId: '',
      picture: '',
      isVeg: true,
      spicy: 0,
      name: '',
      description: '',
      price: 0,
      discount: 0,
      macros: Macros(
        calories: 0,
        proteins: 0,
        fat: 0,
        carbs: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Pizza ID'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the pizza ID';
              }
              return null;
            },
            onSaved: (value) => _pizza.pizzaId = value!,
          ),
          // Add form fields for all pizza attributes
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the pizza name';
              }
              return null;
            },
            onSaved: (value) => _pizza.name = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the pizza description';
              }
              return null;
            },
            onSaved: (value) => _pizza.description = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Picture URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the picture URL';
              }
              return null;
            },
            onSaved: (value) => _pizza.picture = value!,
          ),
          CheckboxListTile(
            title: Text('Is Veg?'),
            value: _isVeg,
            onChanged: (value) {
              setState(() {
                _isVeg = value!;
              });
            },
          ),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(labelText: 'Spicy Level'),
            value: _spicyLevel,
            items: const [
              DropdownMenuItem<int>(
                value: 0,
                child: Text('Spicy'),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text('Bland'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _spicyLevel = value!;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              return null;
            },
            onSaved: (value) => _pizza.price = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Discount'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the discount';
              }
              return null;
            },
            onSaved: (value) => _pizza.discount = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Calories'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the calories';
              }
              return null;
            },
            onSaved: (value) => _calories = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Proteins'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the proteins';
              }
              return null;
            },
            onSaved: (value) => _proteins = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Fat'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the fat';
              }
              return null;
            },
            onSaved: (value) => _fat = int.parse(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Carbs'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the carbs';
              }
              return null;
            },
            onSaved: (value) => _carbs = int.parse(value!),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _savePizza(context);
              }
            },
            child: const Text('Save or update Pizza'),
          ),
        ],
      ),
    );
  }

  void _savePizza(BuildContext context) {
    BlocProvider.of<SavePizzaBloc>(context).add(SavePizza(_pizza as Pizza));
    Navigator.pop(context);
  }
}
