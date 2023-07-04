abstract class DataStates {}

class InitialDataState extends DataStates {}

class ImageCapturedSuccess extends DataStates {}

class ImageCapturedFailed extends DataStates {}

class ObjectDetectionLoading extends DataStates {}

class ObjectDetectionSuccess extends DataStates {}

class ObjectDetectionFailed extends DataStates {
  final String error;

  ObjectDetectionFailed({
    required this.error,
  });
}

class AlarmSettingIsNull extends DataStates {}

class AlarmSetSuccess extends DataStates {}

class AlarmSetFailded extends DataStates {
  final String error;

  AlarmSetFailded({required this.error});
}

class SendMessageLoading extends DataStates {}

class SendMessageSuccess extends DataStates {}

class SendMessageFailed extends DataStates {
  final String error;
  SendMessageFailed({
    required this.error,
  });
}

class TakePhotoToSendInChatLoading extends DataStates {}

class TakePhotoToSendInChatSuccess extends DataStates {}

class TakePhotoToSendInChatFailded extends DataStates {
  final String error;
  TakePhotoToSendInChatFailded({
    required this.error,
  });
}

class UploudImageLoading extends DataStates {}

class UploudImageSuccess extends DataStates {}

class UploudImageFailded extends DataStates {
  final String error;
  UploudImageFailded({
    required this.error,
  });
}

class GetAllImageLoading extends DataStates {}

class GetAllImageSuccess extends DataStates {}

class GetAllImageFailded extends DataStates {
  final String error;
  GetAllImageFailded({
    required this.error,
  });
}

class UserLoggedIn extends DataStates {}

class UserLoggedOut extends DataStates {}

class GetUserDataOnOpenSUcces extends DataStates {}

class GetUserDataOnOpenLoading extends DataStates {}

class GetUserDataOnOpenError extends DataStates {
  String? error;
  GetUserDataOnOpenError({required this.error});
}

class OnBoardingScreenFinish extends DataStates {}

