abstract class DonorCubitStates{}

class DonorInitialState extends DonorCubitStates{}

class DonorLoadingState extends DonorCubitStates{}

class DonorSuccessState extends DonorCubitStates{}

class DonorErrorState extends DonorCubitStates{
  final String error;
  DonorErrorState(this.error);
}


class SearchDonorLoadingState extends DonorCubitStates{}

class SearchDonorSuccessState extends DonorCubitStates{}

class SearchDonorErrorState extends DonorCubitStates{
  final String error;
  SearchDonorErrorState(this.error);
}



