abstract class RegisterCubitState {}

class RegisterInitialState extends RegisterCubitState {}

class RegisterLoadingState extends RegisterCubitState {}

class RegisterSuccessState extends RegisterCubitState {}

class RegisterErrorState extends RegisterCubitState {
  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordVisibility extends RegisterCubitState {}

class UploadPhotoLoadingState extends RegisterCubitState {}

class UploadPhotoSuccessState extends RegisterCubitState {}

class UploadPhotoErrorState extends RegisterCubitState {
  final String error;

  UploadPhotoErrorState(this.error);
}

class GetUserImageLoading extends RegisterCubitState {}

class GetUserImageSuccess extends RegisterCubitState {}

class GetUserImageFailded extends RegisterCubitState {
  final String error;

  GetUserImageFailded({
    required this.error,
  });
}

class PrepareImageAsBytesAndGetSuccess extends RegisterCubitState {}

class PrepareImageAsBytesAndGetLoading extends RegisterCubitState {}

class PrepareImageAsBytesAndGetError extends RegisterCubitState {}

class AddImageBytesInTheModel extends RegisterCubitState {}

class UpdateUserDataInTheDataBaseSuccess extends RegisterCubitState {}

class UpdateUserDataInTheDataBaseLoading extends RegisterCubitState {}

class UpdateUserDataInTheDataBaseError extends RegisterCubitState {}

class UserLoggedOut extends RegisterCubitState {}

class UploadUserPhotoLoadingState extends RegisterCubitState {}

class UploadUserPhotoSuccessState extends RegisterCubitState {}

class UploadUserPhotoErrorState extends RegisterCubitState {
  final String error;

  UploadUserPhotoErrorState(this.error);
}

class LogOutLoading extends RegisterCubitState {}

class LogOutSucces extends RegisterCubitState {}

class LogOutError extends RegisterCubitState {
  final String error;

  LogOutError(this.error);
}
