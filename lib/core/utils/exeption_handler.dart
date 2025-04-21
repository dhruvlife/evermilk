import 'package:dio/dio.dart';

import 'package:milkride/core/failure/failure.dart'; // Make sure to import the correct Failure class

class HandleExeption {
  HandleExeption._();

  static Failure handleError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(messege: "Please check your network connection");
      case DioExceptionType.sendTimeout:
        return Failure(messege: "Please try again");
      case DioExceptionType.receiveTimeout:
        return Failure(messege: "Please try again");
      case DioExceptionType.badResponse:
        return Failure(messege: "Something went wrong");
      case DioExceptionType.connectionError:
        return Failure(messege: "Please check your internet connection");
      default:
        return Failure(messege: "Unexpected error occurred");
    }
  }
}
