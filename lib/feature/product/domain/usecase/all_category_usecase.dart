import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';

class AllCategoryUsecase implements Usecase<CategoryResponse,int>{
  final ProductRepository categoryRepository;
  AllCategoryUsecase({required this.categoryRepository});

  @override
  Future<Either<Failure, CategoryResponse>> call(int userId)async {
    return await categoryRepository.getAllCategories(userId: userId);
  }
}
