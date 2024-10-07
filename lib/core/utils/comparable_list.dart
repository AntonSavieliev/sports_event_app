import 'package:flutter/foundation.dart';

@immutable
class ComparableList<T> {
  const ComparableList(this.value);

  final List<T> value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ComparableList<T> && listEquals(other.value, value);
  }

  @override
  int get hashCode => value.hashCode;
}
