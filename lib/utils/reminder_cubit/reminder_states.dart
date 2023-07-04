abstract class ReminderStates {}

class ReminderInitialState extends ReminderStates {}

class TakePhotoToSendInChatLoading extends ReminderStates {}

class TakePhotoToSendInChatSuccess extends ReminderStates {}

class TakePhotoToSendInChatFailded extends ReminderStates {}

class UploadPrescriptionLoading extends ReminderStates {}

class UploadPrescriptionSuccess extends ReminderStates {}

class UploadPrescriptionFailded extends ReminderStates {}

class SetPrescriptionDataLoading extends ReminderStates {}

class SetPrescriptionDataSuccess extends ReminderStates {}

class SetPrescriptionDataFailded extends ReminderStates {}

class GetAllPrescriptionsLoading extends ReminderStates {}

class GetAllPrescriptionsSuccess extends ReminderStates {}

class GetAllPrescriptionsFailded extends ReminderStates {}
