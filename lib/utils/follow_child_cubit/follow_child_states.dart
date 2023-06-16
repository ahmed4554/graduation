abstract class FollowChildStates {}

class FollowChildIitialState extends FollowChildStates {}

class FollowChildLoadingState extends FollowChildStates {}

class FollowChildSuccessState extends FollowChildStates {}

class FollowChildErrorState extends FollowChildStates {
  final String error;
  FollowChildErrorState({required this.error});
}
