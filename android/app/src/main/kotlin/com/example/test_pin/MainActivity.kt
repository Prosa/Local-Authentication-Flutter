package com.example.test_pin

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeratedPluginRegistrant;

class MainActivity: FlutterFragmentActivity() {
   override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
       GeneratedPluginRegistrant.registerWith(flutterEngine);
   }
}