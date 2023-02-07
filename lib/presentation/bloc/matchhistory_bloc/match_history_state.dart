part of 'match_history_bloc.dart';

abstract class MatchHistoryState extends Equatable {
  const MatchHistoryState();
}

class MatchHistoryInitial extends MatchHistoryState {
  @override
  List<Object> get props => [];
}

class MatchHistoryLoadingState extends MatchHistoryState {
  @override
  List<Object?> get props => [];
}

class MatchHistorySuccessState extends MatchHistoryState {
  List<String> matchesList;

  MatchHistorySuccessState({required this.matchesList});

  @override
  List<Object?> get props => [matchesList];
}

class MatchHistoryFailedState extends MatchHistoryState {
  @override
  List<Object?> get props => [];
}
