

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/instance_manager.dart';
import 'package:test_pin/extension/extension.dart';

class SecureStorageService extends GetxService{

  static SecureStorageService get find => Get.find();

  late final FlutterSecureStorage _secureStorage;

  @override
  void onInit(){
    super.onInit();

    _secureStorage = const FlutterSecureStorage();
  }

  Future<String?> readString(String key) async{
    return await _secureStorage.read(key: key);
  }

  Future<bool?> readBool(String key) async{
    return (await _secureStorage.read(key: key)).toBool();
  }

  Future<void> writeString(String key, String value) async{
    _secureStorage.write(key: key, value: value);
  }

  Future<void> writeBool(String key, bool value) async{
    _secureStorage.write(key: key, value: value.toString());
  }




}