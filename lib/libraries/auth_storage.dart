import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _storage = const FlutterSecureStorage();
  final _key = 'token';

  Future<String?> read() async {
    return await _storage.read(key: _key);
  }

  Future<void> write(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<void> delete() async {
    await _storage.delete(key: _key);
  }

  Future<bool> has() async {
    String? token = await read();
    return token != null;
  }
}
