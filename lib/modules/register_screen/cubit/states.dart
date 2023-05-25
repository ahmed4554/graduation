abstract class RegisterCubitState{}

class RegisterInitialState extends RegisterCubitState{}

class RegisterLoadingState extends RegisterCubitState{}

class RegisterSuccessState extends RegisterCubitState{}

class RegisterErrorState extends RegisterCubitState
{
  final String error;
  RegisterErrorState(this.error);
}

class ChangePasswordVisibility extends RegisterCubitState{}

