part of 'matchesdetail_bloc.dart';

abstract class MatchesdetailState extends Equatable {
  const MatchesdetailState();
}

class MatchesdetailInitial extends MatchesdetailState {
  @override
  List<Object> get props => [];
}

class MatchDetailLoadingState extends MatchesdetailState {
  @override
  List<Object?> get props => [];
}

class MatchDetailFailState extends MatchesdetailState {
  final ExceptionEntity entity;
  MatchDetailFailState({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class MatchDetailSuccessState extends MatchesdetailState {
  final List<MatchHistoryEntity> entity;
  //final MatchHistoryEntity entity;

  MatchDetailSuccessState({required this.entity});

  @override
  List<Object?> get props => [entity];
}
