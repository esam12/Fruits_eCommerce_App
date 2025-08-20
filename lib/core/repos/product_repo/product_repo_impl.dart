import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/models/product_model.dart';
import 'package:fruits/core/repos/product_repo/product_repo.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final FireStoreService fireStoreService;

  ProductRepoImpl({required this.fireStoreService});
  @override
  Future<Either<Failure, List<ProductEntity>>>
      fetchBestSellingProducts() async {
    try {
      var data = await fireStoreService
          .getData(path: BackendEndpoint.getProducts, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      log(
        'Exception in HomeRepoImpl.fetchBestSellingProducts: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
    }
  }

  /// Fetch All Products
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts(
    double? minPrice,
    double? maxPrice,
  ) async {
    try {
      var data = await fireStoreService.getData(
        path: BackendEndpoint.getProducts,
        query: {
          if (minPrice != null) 'minPrice': minPrice,
          if (maxPrice != null) 'maxPrice': maxPrice,
        },
      ) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      log(
        'Exception in HomeRepoImpl.fetchAllProducts: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
    }
  }
}
