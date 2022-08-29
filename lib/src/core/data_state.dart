abstract class DataState<T> {
  final T? data;
  final String? error;
  const DataState({this.data, this.error});
}

class Success<T> extends DataState<T> {
  const Success(T data) : super(data: data);
}

class Failed<T> extends DataState<T> {
  const Failed(String error) : super(error: error);
}
