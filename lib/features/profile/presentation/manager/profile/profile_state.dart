part of 'profile_cubit.dart';

class ProfileState {
  final String name;
  final String email;

  final bool isLoading;
  final bool isCurrentPasswordHidden;
  final bool isNewPasswordHidden;
  final bool isConfirmPasswordHidden;
  final String? errorMessage;

  ProfileState({
    required this.name,
    required this.email,
    required this.isLoading,
    required this.isCurrentPasswordHidden,
    required this.isNewPasswordHidden,
    required this.isConfirmPasswordHidden,
    this.errorMessage,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    bool? isLoading,
    bool? isCurrentPasswordHidden,
    bool? isNewPasswordHidden,
    bool? isConfirmPasswordHidden,
    String? errorMessage,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      isCurrentPasswordHidden:
          isCurrentPasswordHidden ?? this.isCurrentPasswordHidden,
      isNewPasswordHidden: isNewPasswordHidden ?? this.isNewPasswordHidden,
      isConfirmPasswordHidden:
          isConfirmPasswordHidden ?? this.isConfirmPasswordHidden,
      errorMessage: errorMessage,
    );
  }

  factory ProfileState.initial() {
    return ProfileState(
      name: '',
      email: '',
      isLoading: false,
      isCurrentPasswordHidden: true,
      isNewPasswordHidden: true,
      isConfirmPasswordHidden: true,
    );
  }
}
