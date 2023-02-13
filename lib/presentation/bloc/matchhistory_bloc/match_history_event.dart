part of 'match_history_bloc.dart';

abstract class MatchHistoryEvent extends Equatable {
  const MatchHistoryEvent();
}

class GetMatchHistoryEvent extends MatchHistoryEvent {
  final String url;
  const GetMatchHistoryEvent({required this.url});

  @override
  List<Object?> get props => [url];
}
