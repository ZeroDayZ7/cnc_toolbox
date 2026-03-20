import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppObserver extends ProviderObserver {
  const AppObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    debugPrint(
      '🟢 Provider added: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    debugPrint(
      '🔄 Provider updated: ${context.provider.name ?? context.provider.runtimeType}',
    );
    debugPrint('   previous: $previousValue');
    debugPrint('   new: $newValue');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    debugPrint(
      '❌ Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }
}
