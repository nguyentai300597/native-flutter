package com.example.coutekotlin

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.Pigeon
import java.lang.reflect.Method
import java.util.*
import kotlin.random.Random


class MainActivity : AppCompatActivity() {
    private val CHANNEl:String = "amazon"
    companion object {

        private const val TAG_FLUTTER_FRAGMENT = "flutter_fragment"
    }
   private class MyApi:Pigeon.Api{
       override fun search(request: Pigeon.SearchRequest): String {
           return "nguyênn"
       }
   }
    private class Nativedemo(argBinaryMessenger: BinaryMessenger?) :
        Pigeon.Native(argBinaryMessenger) {


    }
    private var flutterFragment: FlutterFragment? = null
    var flutterEngine : FlutterEngine?=null
    val  CHANNEL: MethodChannel? =
        flutterEngine?.dartExecutor?.binaryMessenger?.let { MethodChannel(it,"FLUTTER_CHANNEL") }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        flutterEngine = FlutterEngine(this)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine?.dartExecutor?.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine)

        Pigeon.Api.setup(flutterEngine!!.dartExecutor.binaryMessenger,  MyApi())

        val channel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEl)
        channel.setMethodCallHandler { call, result ->

            if (call.method == "s3_upload") {
                //Add you login here
                print("da nhan")
                channel.invokeMethod("callBack", "data1")



            }
        }

        /////////////////////////.file
        // Start executing Dart code to pre-warm the FlutterEngine.
//        flutterEngine!!.navigationChannel.setInitialRoute("flutter_fragment")
//        flutterEngine!!.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        )
//

//
//        // Cache the FlutterEngine to be used by FlutterActivity.
//        FlutterEngineCache
//            .getInstance()
//            .put("my_engine_id", flutterEngine)
//

//        CHANNEL?.setMethodCallHandler { call, result ->
//            if(call.equals("search")){
//                Log.d("TAG", "onMethodCall: 123213")
//            }else{
//                Log.d("TAG", "onMethodCall: 123213")
//            }
//        }
//        startActivity(
//            FlutterActivity
//                .withNewEngine()
//                .initialRoute("flutter_fragment")
//                .build(this)
//        )



        /////////////////

        // Configure an initial route.
//
//        flutterEngine!!.navigationChannel.setInitialRoute("flutter_fragment");
//        // Start executing Dart code to pre-warm the FlutterEngine.
//        flutterEngine!!.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        )
//        // Cache the FlutterEngine to be used by FlutterActivity or FlutterFragment.
//        FlutterEngineCache
//            .getInstance()
//            .put("flutter_fragment", flutterEngine)
//        startActivity(FlutterActivity.createDefaultIntent(this))
//
//
//        val fragmentManager: FragmentManager = supportFragmentManager
//
//        // Attempt to find an existing FlutterFragment, in case this is not the
//        // first time that onCreate() was run.
//        flutterFragment = fragmentManager
//            .findFragmentByTag(TAG_FLUTTER_FRAGMENT) as FlutterFragment?
//
//        // Create and attach a FlutterFragment if one does not exist.
//        if (flutterFragment == null) {
//            var newFlutterFragment = FlutterFragment.createDefault()
//            flutterFragment = newFlutterFragment
//            fragmentManager
//                .beginTransaction()
//                .add(
//                    R.id.fragmentContainerView,
//                    newFlutterFragment,
//                    TAG_FLUTTER_FRAGMENT
//                )
//                .commit()
//     }
        var onlick=findViewById<Button>(R.id.btnonlick)
        onlick.setOnClickListener {
//           Nativedemo( flutterEngine?.dartExecutor?.binaryMessenger).initpage {


            startActivity(
                FlutterActivity
                    .withCachedEngine("my_engine_id")
                    .build(this)
            )


        }}

//    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//        Log.d("TAG_onMethodCall", "onMethodCall:$call ")
//        if(call.equals("search")){
//            Log.d("TAG", "onMethodCall: 123213")
//        }else{
//            Log.d("TAG", "onMethodCall: 123213")
//        }

//
      //  CHANNEL.setMethodCallHandler { call, result ->
//            if (call.method.equals("helloFromNativeCode")){
//                val batteryLevel =-1
//
//                if (batteryLevel != -1) {
//                    Log.d("TAG", "onMethodCall: 123213")
//                    result.success(batteryLevel)
//                } else {
//                    result.error("UNAVAILABLE", "Battery level not available.", null)
//                }
//            } else {
//                result.notImplemented()
//
//        }  }
//        flutterEngine?.dartExecutor?.binaryMessenger?.let {
//            MethodChannel(it, "FLUTTER_CHANNEL").setMethodCallHandler {
//                // This method is invoked on the main thread.
//
//                    call, result ->
//                Log.d("TAG", "onMethodCall: 123213")
//                if (call.method.equals("helloFromNativeCode")){
//                    val batteryLevel =-1
//
//                    if (batteryLevel != -1) {
//                        Log.d("TAG", "onMethodCall: 123213")
//                        result.success(batteryLevel)
//                    } else {
//                        result.error("UNAVAILABLE", "Battery level not available.", null)
//                    }
//                } else {
//                    result.notImplemented()
//                }
//            }
//        }



 //   }


    override fun onPostResume() {
        super.onPostResume()
    }

}