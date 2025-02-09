import 'package:gym_daily/src/utils/exceptions/property_not_found_exception.dart';

extension ObjectX<T extends Object?> on T? {
  V getNotNullObjectPropertyOrThrow<V>(
    V? Function(T) getter,
    String propertyName,
  ) {
    if (this == null) {
      throw PropertyNotFoundException<V>(object: this);
    }

    final value = getter(this as T);
    print(valus);

    if (value == null) {
      throw PropertyNotFoundException<V>(object: this);
    }

    return value;
  }
}
