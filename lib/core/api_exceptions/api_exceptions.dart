import 'package:clean_arch/core/errors_model/errors_model.dart';

class ServerException{
  final ErrorsModel errorsModel;

  const ServerException(this.errorsModel);
}