enum FormStatus {
  initial,
  inProgress,
  success,
  failure,
  canceled;

  bool get isInitial => this == FormStatus.initial;
  bool get isInProgress => this == FormStatus.inProgress;
  bool get isSuccess => this == FormStatus.success;
  bool get isFailure => this == FormStatus.failure;
  bool get isCanceled => this == FormStatus.canceled;
  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}
