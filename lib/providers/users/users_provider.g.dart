// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Users)
const usersProvider = UsersProvider._();

final class UsersProvider extends $NotifierProvider<Users, List<User>> {
  const UsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersHash();

  @$internal
  @override
  Users create() => Users();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<User> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<User>>(value),
    );
  }
}

String _$usersHash() => r'4283faaa76dc0d50fb9787751ecf7b7af66c8627';

abstract class _$Users extends $Notifier<List<User>> {
  List<User> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<User>, List<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<User>, List<User>>,
              List<User>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
