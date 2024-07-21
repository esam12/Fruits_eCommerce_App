import 'package:bloc/bloc.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }

  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
