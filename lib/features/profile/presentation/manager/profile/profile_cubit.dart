import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/profile/domain/entities/profile_entity.dart';
import 'package:fruits/features/profile/domain/repos/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileState.initial());

  Future<void> loadUserData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final userProfile = await profileRepository.getUserProfile();
      final name = userProfile.name;
      final email = userProfile.email;

      emit(state.copyWith(
        name: name,
        email: email,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> updateUserProfile(UserProfileEntity userProfile) async {
    emit(state.copyWith(isLoading: true));
    try {
      await profileRepository.updateUserProfile(userProfile);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  
  }

  void toggleCurrentPasswordVisibility() {
    emit(state.copyWith(
      isCurrentPasswordHidden: !state.isCurrentPasswordHidden,
    ));
  }

  void toggleNewPasswordVisibility() {
    emit(state.copyWith(
      isNewPasswordHidden: !state.isNewPasswordHidden,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(
      isConfirmPasswordHidden: !state.isConfirmPasswordHidden,
    ));
  }
}
