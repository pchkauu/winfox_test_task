import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

part 'fruit_event.dart';
part 'fruit_state.dart';

@injectable
class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final IFruitRepository _fruitRepository;

  FruitBloc({
    required IFruitRepository fruitRepository,
  })  : _fruitRepository = fruitRepository,
        super(const FruitInitialState()) {
    on<FruitInitialEvent>(_onInitial, transformer: droppable());
    on<FruitRefreshEvent>(_onRefresh, transformer: droppable());
  }

  Future<void> _onInitial(
    FruitInitialEvent event,
    Emitter<FruitState> emit,
  ) async {
    if (state is FruitPendingState) {
      return;
    }

    emit(const FruitPendingState());

    final fetchResult = await _fruitRepository.fetchAllFruits();

    if (fetchResult.isLeft) {
      emit(
        FruitFailureState(failure: fetchResult.left),
      );

      return;
    }

    emit(
      FruitLoadedState(fruits: fetchResult.right),
    );

    return;
  }

  Future<void> _onRefresh(
    FruitRefreshEvent event,
    Emitter<FruitState> emit,
  ) async {
    if (state is FruitPendingState) {
      return;
    }

    emit(const FruitPendingState());

    final fetchResult = await _fruitRepository.fetchAllFruits();

    event.completer?.complete();

    if (fetchResult.isLeft) {
      emit(
        FruitFailureState(failure: fetchResult.left),
      );

      return;
    }

    emit(
      FruitLoadedState(fruits: fetchResult.right),
    );

    return;
  }
}
