abstract class DatabaseRepository<T> {
  Future<T> insert(T object);

  Future<int> update(T object);

  Future<T> delete(T object);

  Future<List<T>> getData();

  Future<void> clear();
}