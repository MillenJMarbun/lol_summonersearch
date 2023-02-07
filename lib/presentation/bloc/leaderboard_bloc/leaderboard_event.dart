part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();
}

class GetLeaderboardEvent extends LeaderboardEvent {
  final LeaderboardInquiryParameter params;

  const GetLeaderboardEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class GetIconEvent extends LeaderboardEvent {
  //final LeaderboardInquiryParameter params;
  // final LeaderboardInquiryEntity entity1;
  final int index;

  const GetIconEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
