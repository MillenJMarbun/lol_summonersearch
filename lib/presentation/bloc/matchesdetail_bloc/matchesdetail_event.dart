part of 'matchesdetail_bloc.dart';

abstract class MatchesdetailEvent extends Equatable {
  const MatchesdetailEvent();
}

class GetMatchesDetailEvent extends MatchesdetailEvent {
  List<String> matches;
  MatchHistoryParameter param;

  GetMatchesDetailEvent({required this.matches, required this.param});
  @override
  List<Object?> get props => [matches, param];
}
