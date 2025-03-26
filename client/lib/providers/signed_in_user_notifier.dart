import 'package:client/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signed_in_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class SignedInUserNotifier extends _$SignedInUserNotifier {
  @override
  User? build() {
    return null;
  }

  void setSignedInUser(User? user) {
    state = user;
  }
}
