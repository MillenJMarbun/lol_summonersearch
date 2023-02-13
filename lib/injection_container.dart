import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lol_summonersearch/data/datasources/modul_leaderboard/lederboard_remote_data_source.dart';
import 'package:lol_summonersearch/data/datasources/modul_match_history/match_history_remote_data_source.dart';
import 'package:lol_summonersearch/data/datasources/modul_summoner/summoner_remote_data_source.dart';
import 'package:lol_summonersearch/data/repositories/leaderboardinquiry_repository_impl.dart';
import 'package:lol_summonersearch/data/repositories/match_history_repository_impl.dart';
import 'package:lol_summonersearch/data/repositories/summoner_repository_impl.dart';
import 'package:lol_summonersearch/data/utils/network_info.dart';
import 'package:lol_summonersearch/domain/repositories/leaderboard_repository.dart';
import 'package:lol_summonersearch/domain/repositories/match_history_repository.dart';
import 'package:lol_summonersearch/domain/repositories/summoner_repository.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_match_history/match_history.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_summoner/get_by_summonername.dart';
import 'package:lol_summonersearch/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/leaderboard_bloc/leaderboard_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchesdetail_bloc/matchesdetail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchhistory_bloc/match_history_bloc.dart';

import 'domain/use_cases/modul_leaderboard/leaderboard_inquiry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => DetailBloc(getBySummonerName: sl()));
  sl.registerFactory(() => LeaderboardBloc(leaderBoardInquiry: sl()));
  sl.registerFactory(() => MatchHistoryBloc());
  sl.registerFactory(() => MatchesdetailBloc(matchHistory: sl()));

  //usecase
  sl.registerLazySingleton(() => GetBySummonerName(sl()));
  sl.registerLazySingleton(() => LeaderBoardInquiry(sl()));
  sl.registerLazySingleton(() => MatchHistory(sl()));

  //repository
  sl.registerLazySingleton<SummonerRepository>(
      () => SummonerRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<LeaderboardRepository>(() =>
      LeaderboardRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<MatchHistoryRepository>(() =>
      MatchHistoryRepositoryimpl(remoteDataSource: sl(), networkInfo: sl()));

  //data source
  sl.registerLazySingleton<SummonerRemoteDataSource>(
      () => SummonerRemoteDataSourceImpl());
  sl.registerLazySingleton<LeaderboardInquiryRemoteDataSource>(
      () => LeaderboardInquiryRemoteDataSourceImpl());
  sl.registerLazySingleton<MatchHistoryRemoteDataSource>(
      () => MatchHistoryRemoteDataSourceimpl());

  //helper
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
