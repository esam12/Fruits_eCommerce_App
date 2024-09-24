import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';
import 'package:fruits/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getUserName() async {
    emit(HomeLoading());
    final result = await homeRepo.getUserName();

    result.fold(
        (failure) => emit(
              HomeFailure(
                message: failure.message.toString(),
              ),
            ), (userName) async {
      final productsResult = await homeRepo.fetchLimitedProducts(4);
      productsResult.fold(
        (failure) => emit(HomeFailure(message: failure.message.toString())),
        (products) => emit(HomeSuccess(userName: userName, products: products)),
      );
    });
  }

  Future<void> fetchAllProducts() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAllProducts();
    result.fold(
      (failure) =>
          emit(BestSellerViewFailure(message: failure.message.toString())),
      (products) => emit(BestSellerViewSuccess(products: products)),
    );
  }
}
