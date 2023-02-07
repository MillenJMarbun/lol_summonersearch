part of 'leaderboard_bloc.dart';

LeaderboardInquiryEntity entity = LeaderboardInquiryEntity();

abstract class LeaderboardState {
  LeaderboardInquiryEntity get props => entity;
  //const LeaderboardState();
}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoadingState extends LeaderboardState {}

class LeaderboardSuccessState extends LeaderboardState {
  final LeaderboardInquiryEntity entity;
  LeaderboardSuccessState({required this.entity});
}

class LeaderboardFailedState extends LeaderboardState {
  final ExceptionEntity entity;

  LeaderboardFailedState({required this.entity});
}

class IconLoadingState extends LeaderboardState {}

class IconSuccessState extends LeaderboardState {
  final int index;

  IconSuccessState({required this.index});
}
