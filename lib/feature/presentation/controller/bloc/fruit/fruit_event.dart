part of 'fruit_bloc.dart';

sealed class FruitEvent extends Equatable {
  const FruitEvent();

  @override
  List<Object?> get props => [];
}

class FruitInitialEvent extends FruitEvent {
  const FruitInitialEvent();
}

class FruitRefreshEvent extends FruitEvent {
  final Completer<void>? completer;

  const FruitRefreshEvent({
    this.completer,
  });

  @override
  List<Object?> get props => [
        completer,
      ];
}
