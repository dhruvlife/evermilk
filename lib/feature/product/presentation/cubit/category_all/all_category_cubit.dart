import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';
import 'package:milkride/feature/product/domain/usecase/all_category_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_state.dart';

class AllCategoryCubit extends Cubit<CategoryState> {
  final AllCategoryUsecase allCategoryUsecase;
  AllCategoryCubit({required this.allCategoryUsecase}) : super(CategoryInitial());
  
  Future<void> fetchCategories({required int userId}) async {
    emit(CategoryLoading());
    final Either<Failure, CategoryResponse> result = await allCategoryUsecase(userId);
    result.fold(
      (failure) => emit(CategoryError(message:failure.messege)),
      (response){
        if(response.status == AppStrings.success){
           emit(CategoryLoaded(response:response));
        }else{
          AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
        }
      },
    );
  }
}
