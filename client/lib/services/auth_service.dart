import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Firebase Authentication による認証を行うクラスです。
/// シングルトンパターンを採用しており、`AuthService.instance` で利用できます。
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// メールアドレスとパスワードで新規登録を行います。
  ///
  /// - [email]: ユーザーのメールアドレス
  /// - [password]: ユーザーのパスワード
  /// - 成功時は `UserCredential` を返します。
  /// - 失敗時は例外を投げます。
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Sign Up Error: $e');
    }
  }

  /// メールアドレスとパスワードでログインを行います。
  ///
  /// - [email]: ユーザーのメールアドレス
  /// - [password]: ユーザーのパスワード
  /// - 成功時は `UserCredential` を返します。
  /// - 失敗時は例外を投げます。
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Sign In Error: $e');
    }
  }

  /// Googleアカウントでログイン（新規登録を含む）を行います。
  ///
  /// - 既存アカウントがあればログイン
  /// - 未登録なら自動的に新規登録
  /// - 成功時は `UserCredential` を返します。
  /// - 失敗時は例外を投げます。
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google Sign-In aborted');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Google Sign-In Error: $e');
    }
  }

  /// ユーザーをログアウトします。
  ///
  /// - Firebase Auth と Google のセッションをクリアします。
  /// - 失敗時は例外を投げます。
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      throw Exception('Sign Out Error: $e');
    }
  }

  /// 現在のログインユーザーを取得します。
  User? get currentUser => _auth.currentUser;
}
