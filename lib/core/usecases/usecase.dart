import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_learn/core/error/faliures.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class BooleanParams extends Equatable {
  final bool isTrue;
  const BooleanParams({required this.isTrue});
  @override
  List<Object> get props => [];
}

class IdParams extends Equatable {
  final int id;
  const IdParams({required this.id});
  @override
  List<Object> get props => [];
}

class QueryParams extends Equatable {
  final String query;
  const QueryParams({required this.query});
  @override
  List<Object> get props => [];
}

class DateRangeParams extends Equatable {
  final String startDate;
  final String endDate;
  const DateRangeParams({required this.startDate, required this.endDate});
  @override
  List<Object> get props => [startDate, endDate];
}

class SearchAndFilterAssetParams extends Equatable {
  final String query;
  final String? checkingResult;
  const SearchAndFilterAssetParams({required this.query, this.checkingResult});
  @override
  List<Object> get props => [query];
}

class SearchAndFilterInventoryParams extends Equatable {
  final String query;
  final String? year;
  const SearchAndFilterInventoryParams({required this.query, this.year});
  @override
  List<Object> get props => [query];
}

class MapParams extends Equatable {
  final Map<String, dynamic> data;
  const MapParams({required this.data});

  @override
  List<Object> get props => [data];
}
