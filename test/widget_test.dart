import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:pizza_app/screens/auth/views/sign_in_screen.dart';
import 'package:pizza_app/screens/auth/views/sign_up_screen.dart';

// Define mock Blocs
class MockSignInBloc extends Mock implements SignInBloc {
  @override
  void add(SignInEvent event) {
    // TODO: implement add
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  void emit(SignInState state) {
    // TODO: implement emit
  }

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  void on<E extends SignInEvent>(EventHandler<E, SignInState> handler,
      {EventTransformer<E>? transformer}) {
    // TODO: implement on
  }

  @override
  void onChange(Change<SignInState> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(SignInEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Transition<SignInEvent, SignInState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement state
  SignInState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<SignInState> get stream => throw UnimplementedError();
}

class MockSignUpBloc extends Mock implements SignUpBloc {}

void main() {
  group('SignInScreen Widget Tests', () {
    late MockSignInBloc mockSignInBloc;

    setUp(() {
      mockSignInBloc = MockSignInBloc();
    });

    testWidgets('Test Successful Sign In', (WidgetTester tester) async {
      // Mock SignInSuccess state
      when(mockSignInBloc.state).thenReturn(SignInSuccess());

      // Build SignInScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignInBloc,
          child: SignInScreen(),
        ),
      ));

      // Verify signInRequired flag is set to false
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Test Sign In Process', (WidgetTester tester) async {
      // Mock SignInProcess state
      when(mockSignInBloc.state).thenReturn(SignInProcess());

      // Build SignInScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignInBloc,
          child: SignInScreen(),
        ),
      ));

      // Verify signInRequired flag is set to true
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Test Sign In Failure', (WidgetTester tester) async {
      when(mockSignInBloc.state).thenReturn(SignInFailure());

      // Build SignInScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignInBloc,
          child: SignInScreen(),
        ),
      ));

      // Verify error message is displayed
      expect(find.text('Invalid email or password'), findsOneWidget);
    });

    testWidgets('Test Form Validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignInBloc,
          child: SignInScreen(),
        ),
      ));

      await tester.enterText(find.byType(TextField).first, '');
      await tester.enterText(find.byType(TextField).last, '');

      await tester.tap(find.text('Sign In'));

      await tester.pump();

      expect(find.text('Please fill in this field'), findsNWidgets(2));
    });
  });

  group('SignUpScreen Widget Tests', () {
    late MockSignUpBloc mockSignUpBloc;

    setUp(() {
      mockSignUpBloc = MockSignUpBloc();
    });

    testWidgets('Test Successful Sign Up', (WidgetTester tester) async {
      when(mockSignUpBloc.state as SignInState).thenReturn(SignUpSucccess());

      // Build SignUpScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignUpBloc,
          child: SignUpScreen(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Test Sign Up Process', (WidgetTester tester) async {
      when(mockSignUpBloc.state as SignInState).thenReturn(SignUpProcess());

      // Build SignUpScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignUpBloc,
          child: SignUpScreen(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Test Form Validation', (WidgetTester tester) async {
      // Build SignUpScreen widget
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: mockSignUpBloc,
          child: SignUpScreen(),
        ),
      ));

      // Enter invalid email, password, and name
      await tester.enterText(find.byType(TextField).at(0), '');
      await tester.enterText(find.byType(TextField).at(1), '');
      await tester.enterText(find.byType(TextField).at(2), '');

      await tester.tap(find.text('Sign Up'));

      await tester.pump();

      expect(find.text('Please fill in this field'), findsNWidgets(3));
    });
  });
}

when(SignInState state) {}
