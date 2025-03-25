import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Cloud Storage for Firebaseとのデータのやり取りを行うサービスクラス。
class FirebaseStorageService {
  FirebaseStorageService._();
  static final FirebaseStorageService instance = FirebaseStorageService._();

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// ファイルをアップロードする。
  Future<void> put(File file, String storagePath) async {
    final storageRef = _firebaseStorage.ref().child(storagePath);
    final metadata = SettableMetadata(contentType: 'image/png');
    try {
      await storageRef.putFile(file);
      await storageRef.updateMetadata(metadata);
    } catch (e) {
      throw Exception('Firebase Cloud Storageへのファイルのアップロードに失敗しました: $e');
    }
  }

  /// ファイルを消去する。
  Future<void> delete(String storagePath) async {
    final storageRef = _firebaseStorage.ref().child(storagePath);
    try {
      await storageRef.delete();
    } catch (e) {
      throw Exception('Firebase Cloud Storageのファイルの削除に失敗しました: $e');
    }
  }
}
