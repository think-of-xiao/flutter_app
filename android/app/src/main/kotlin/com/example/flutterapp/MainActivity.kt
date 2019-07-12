package com.example.flutterapp

import android.Manifest
import android.annotation.TargetApi
import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.text.TextUtils
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private var sharedText: String = ""
    private var mAction: String = ""
    private var mType: String = ""
    private  var locationManager: LocationManager? = null
    private var gps: Boolean = false
    private var network: Boolean = false
    private var locationData: String = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        // 处理intent，一旦我们从intent中获得共享文本数据，我们就会持有它，直到Flutter在完成准备就绪时请求它
        mAction = intent.action
        mType = if (intent.type == null) "" else intent.type
        if (Intent.ACTION_SEND == mAction && !TextUtils.isEmpty(mType) && mType != "") {
            if ("text/plain" == mType) {
                handlerSendText(intent)
            }
        }
        // 我们首先处理Android端的共享文本数据，然后等待Flutter请求数据，然后通过MethodChannel发送。
        MethodChannel(flutterView, "app.channel.shared.data")
                .setMethodCallHandler(MethodChannel.MethodCallHandler { methodCall, result ->
                    if (methodCall.method!!.contentEquals("getSharedText")) {
                        result.success(this.sharedText)
                        sharedText = ""
                    }
                })

        // flutter调用原生gps传感器
        MethodChannel(flutterView, "samples.flutter.io/gps")
                .setMethodCallHandler(MethodChannel.MethodCallHandler { methodCall, result ->
                    if (methodCall.method.equals("inspectionGPS")){ // 检测gps状态
                        val isOpen: Boolean = isOpen()
                        if (isOpen){
                            result.success("gps已开启")
                        }
                        result.success("gps未开启")
                    }else if(methodCall.method.equals("openGPS")){ // 打开gps
                        openGPSSettings(this@MainActivity)
                    }else if(methodCall.method.equals("getDate")){ // 获取经纬度
                        initLocation()
                    }
                })
    }

    private var locationListener = object: LocationListener{

        override fun onLocationChanged(location: Location?) {
            // 当定位信息发生变化是更新定位
            if (location != null) {
                locationData = updateShow(location).toString()
                println("1.返回回来的$locationData")
                AlertDialog.Builder(this@MainActivity).setTitle("地区的详细信息").setMessage(locationData).show()
            }
        }

        override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {
            AlertDialog.Builder(this@MainActivity).setTitle("onStatusChanged").setMessage(locationData).show()
        }

        override fun onProviderEnabled(provider: String?) {
            AlertDialog.Builder(this@MainActivity).setTitle("onProviderEnabled").setMessage(locationData).show()
            locationData = updateShow((getSystemService(Context.LOCATION_SERVICE) as LocationManager).getLastKnownLocation(provider)).toString()
        }

        override fun onProviderDisabled(provider: String?) {
            AlertDialog.Builder(this@MainActivity).setTitle("onProviderDisabled").setMessage(locationData).show()
            locationData = updateShow(null).toString()
        }
    }

    /**
     * 获取经纬度
     */
    @TargetApi(Build.VERSION_CODES.M)
    private fun initLocation() {
        // 设置间隔每两秒获得一次gps定位信息
        if(checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
                && checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED){
            Toast.makeText(this@MainActivity, "没有权限这么做", Toast.LENGTH_SHORT).show()
            return
        }
        (getSystemService(Context.LOCATION_SERVICE) as LocationManager).requestLocationUpdates(LocationManager.GPS_PROVIDER, 2000, 8.toFloat(), locationListener)
    }

    // 定义一个更新显示的函数
    private fun updateShow(mLocation: Location?): String? {
        if (mLocation != null) {
            val sb = StringBuilder()
            sb.append("当前的位置信息：\n")
            sb.append("经度：" + mLocation.longitude + "\n")
            sb.append("纬度：" + mLocation.latitude + "\n")
            sb.append("定位精度：" + mLocation.accuracy + "\n")
            println(sb.toString())
            return sb.toString()
        }
        return "毛豆没有"
    }

    private fun openGPSSettings(activity: Activity?) {
        if (checkGpsIsOpen())
            Toast.makeText(activity, "gps is open true", Toast.LENGTH_SHORT).show()
        else
            AlertDialog.Builder(activity)
                    .setTitle("open gps")
                    .setMessage("go to open")
                    // 关闭dialog
                    .setNegativeButton("cancel", DialogInterface.OnClickListener { dialog, which ->
                        Toast.makeText(activity, "close", Toast.LENGTH_SHORT).show()
                        dialog.dismiss()
                    })
                    // 打开设置界面
                    .setNegativeButton("setting", DialogInterface.OnClickListener { dialog, which ->
                        startActivityForResult(Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS), 1)
                    })
                    .setCancelable(false).show()
    }

    private fun checkGpsIsOpen(): Boolean{
        var isOpen: Boolean = false
        val manager: LocationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        isOpen = manager.isProviderEnabled(LocationManager.GPS_PROVIDER)
        return isOpen
    }

    private fun isOpen(): Boolean {
        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager?
        gps = locationManager!!.isProviderEnabled(LocationManager.GPS_PROVIDER)
        network = locationManager!!.isProviderEnabled(LocationManager.NETWORK_PROVIDER)
        if (gps || network){
            return true
        }
        return false
    }

    private fun handlerSendText(mIntent: Intent) {
        sharedText = mIntent.getStringExtra(Intent.EXTRA_TEXT)
    }
}
