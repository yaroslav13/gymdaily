import 'package:flutter/material.dart';

extension type const GymDailyEdgeInsets(EdgeInsets _) implements EdgeInsets {
  const GymDailyEdgeInsets.bodyInsets()
      : this(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        );
}
