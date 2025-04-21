import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';


abstract interface class Usecase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}
class NoParam {}

