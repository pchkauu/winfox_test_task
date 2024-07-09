import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final Object? error;
  final StackTrace? stackTrace;
  final FailureKey key;

  const Failure({
    required this.error,
    required this.stackTrace,
    required this.key,
  });

  Failure copyWith({
    Object? error,
    StackTrace? stackTrace,
    FailureKey? key,
  }) {
    return Failure(
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      key: key ?? this.key,
    );
  }

  @override
  List<Object?> get props => [
        error,
        stackTrace,
        key,
      ];
}

class FailureKey implements Exception {}
