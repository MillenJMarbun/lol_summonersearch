part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailLoadingState extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailSuccessState extends DetailState {
  final GetBySummonerNameEntity entity;
  final GetBySummonerNameParameter params;
  DetailSuccessState({required this.entity, required this.params});

  @override
  List<Object> get props => [entity];
}

class DetailFailedState extends DetailState {
  final ExceptionEntity entity;

  DetailFailedState({required this.entity});

  @override
  List<Object> get props => [entity];
}
