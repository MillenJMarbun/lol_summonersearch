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
  @override
  List<Object?> get props => [];
}

class MatchDetailSuccessState extends MatchesdetailState {
  List<GetMatchesResponseModel> matches;

  MatchDetailSuccessState({required this.matches});

  @override
  List<Object?> get props => [matches];
}
