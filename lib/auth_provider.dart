import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  bool build() {
    return false;
  }

  String? _emailError;
  String? get emailError => _emailError;
  set emailError(String? value) {
    _emailError = value;
    ref.notifyListeners();
  }

  String? _passwordError;
  String? get passwordError => _passwordError;
  set passwordError(String? value) {
    _passwordError = value;
    ref.notifyListeners();
  }

  void login({required String email, required String password}) {
    emailError = null;
    passwordError = null;
    if (email != 'musthafa') {
      emailError = 'Invalid Email';
    } else if (password != '1234') {
      emailError = null;
      passwordError = 'Invalid Password';
    } else {
      emailError = null;
      passwordError = null;
      state = true;
    }
  }
}
