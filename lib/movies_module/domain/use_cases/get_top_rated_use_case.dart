import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_exceptions/api_exceptions.dart';
import '../entities/movie.dart';

class GetTopRatedUseCase{
  final BaseRepository baseRepository;

  GetTopRatedUseCase(this.baseRepository);

  Future<Either<ServerException, List<Movies>>> executeGetTopRated()async{
    return await baseRepository.getTopRated();
  }
}