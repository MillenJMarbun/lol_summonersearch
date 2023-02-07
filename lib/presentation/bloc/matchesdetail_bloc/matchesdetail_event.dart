part of 'matchesdetail_bloc.dart';

abstract class MatchesdetailEvent extends Equatable {
  const MatchesdetailEvent();
}

class GetMatchesDetailEvent extends MatchesdetailEvent {
  List<String> matches;

  GetMatchesDetailEvent({required this.matches});
  @override
  List<Object?> get props => [matches];
}
