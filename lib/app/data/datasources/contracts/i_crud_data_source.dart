abstract class ICrudDataSource<T> {
  Future<List<T>> all();
  Future<T> find(int id);
  Future<T> create(T entity);
  Future<bool> update(T entity);
  Future<bool> delete(int id);
}
