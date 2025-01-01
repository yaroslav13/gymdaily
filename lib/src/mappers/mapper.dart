import 'package:flutter/cupertino.dart';

abstract interface class Mapper<T, V> {
  T? map(V instance);
}

mixin ListMapper<T, V> implements Mapper<T, V> {
  List<T> mapList(List<V> list) {
    final mappedList = <T>[];
    for (final instance in list) {
      if (instance != null) {
        final mappedInstance = map(instance);
        if (mappedInstance != null) {
          mappedList.add(mappedInstance);
        }
      }
    }
    return mappedList;
  }
}

mixin SafeMapper<T, V> implements Mapper<T, V> {
  @protected
  T mapSafe(V instance);

  @override
  T? map(V? instance) {
    if (instance == null) {
      return null;
    }
    try {
      return mapSafe(instance);
    } on Object {
      /// TODO: log error to analytics

      return null;
    }
  }
}
