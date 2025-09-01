enum StateStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isLoaded => this == StateStatus.loaded;
  bool get isError => this == StateStatus.error;
}
