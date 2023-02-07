part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class GetBySummonerNameEvent extends DetailEvent {
  final GetBySummonerNameParameter params;

  const GetBySummonerNameEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
