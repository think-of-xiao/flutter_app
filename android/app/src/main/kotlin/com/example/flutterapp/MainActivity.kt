package com.example.flutterapp

import android.content.Intent
import android.os.Bundle
import android.text.TextUtils
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private var sharedText: String = ""
  private var mAction: String = ""
  private var mType: String = ""
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    // 处理intent，一旦我们从intent中获得共享文本数据，我们就会持有它，直到Flutter在完成准备就绪时请求它
    mAction = intent.action
    mType = if(intent.type == null) "" else intent.type
    if (Intent.ACTION_SEND == mAction && !TextUtils.isEmpty(mType) && mType != ""){
      if ("text/plain" == mType){
          handlerSendText(intent)
      }
    }
    // 我们首先处理Android端的共享文本数据，然后等待Flutter请求数据，然后通过MethodChannel发送。
    MethodChannel(flutterView, "app.channel.shared.data")
            .setMethodCallHandler(MethodChannel.MethodCallHandler {
              methodCall, result ->
              if (methodCall.method!!.contentEquals("getSharedText")){
                result.success(this.sharedText)
                sharedText = ""
              }
            })
  }

  private fun handlerSendText(mIntent: Intent){
    sharedText = mIntent.getStringExtra(Intent.EXTRA_TEXT)
  }
}
