import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.fetchBestSellingProducts();

    result.fold(
        (failure) => emit(ProductsFailure(message: failure.message.toString())),
        (products) => emit(ProductsSuccess(products: products)));
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.fetchAllProducts();

    result.fold(
        (failure) => emit(ProductsFailure(message: failure.message.toString())),
        (products) => emit(ProductsSuccess(products: products)));
  }
}
