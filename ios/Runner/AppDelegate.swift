import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: ApiConstants.apiKeyChannelName, binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == ApiConstants.setGoogleMapsApiKeyMethod {
                if let apiKey = call.arguments as? String {
                    GMSServices.provideAPIKey(apiKey)
                }
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
