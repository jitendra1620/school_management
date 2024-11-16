extension FutureExt<T> on T {
  Future<T> future() {
    return Future.value(this);
  }
}