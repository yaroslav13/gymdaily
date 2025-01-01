final class PropertyNotFoundException<V> implements Exception {
  const PropertyNotFoundException({this.object});

  final Object? object;

  @override
  String toString() {
    return 'PropertyNotFoundException<$V>: $object';
  }
}
