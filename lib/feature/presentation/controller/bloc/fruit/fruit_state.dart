part of 'fruit_bloc.dart';

sealed class FruitState extends Equatable {
  const FruitState();

  @override
  List<Object?> get props => [];
}

class FruitInitialState extends FruitState {
  const FruitInitialState();
}

class FruitPendingState extends FruitState {
  const FruitPendingState();
}

class FruitLoadedState extends FruitState {
  final List<Fruit> fruits;

  const FruitLoadedState({
    required this.fruits,
  });

  @override
  List<Object?> get props => [
        fruits,
      ];
}

class FruitFailureState extends FruitState {
  final Failure failure;

  const FruitFailureState({
    required this.failure,
  });

  @override
  List<Object?> get props => [
        failure,
      ];
}
