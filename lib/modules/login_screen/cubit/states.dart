abstract class LoginCubitState {}

class LoginInitialState extends LoginCubitState {}

class LoginLoadingState extends LoginCubitState {}

class LoginSuccessState extends LoginCubitState {}

class LoginErrorState extends LoginCubitState {
  final String error;

  LoginErrorState(this.error);
}

class CheckState extends LoginCubitState {}

class ChangePasswordVisibility extends LoginCubitState {}

class GuestLoadingState extends LoginCubitState {}

class GuestSuccessState extends LoginCubitState {}

class GuestErrorState extends LoginCubitState {}
