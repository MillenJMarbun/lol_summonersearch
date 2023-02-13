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
  List<String> matcheslist;
  MatchHistorySuccessState({required this.matcheslist});
  @override
  List<Object?> get props => [matcheslist];
}

class MatchHistoryFailedState extends MatchHistoryState {
  @override
  List<Object?> get props => [];
}
