#import "FlutterStethoPlusPlugin.h"

@implementation FlutterStethoPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_stetho_plus"
            binaryMessenger:[registrar messenger]];
  FlutterStethoPlusPlugin* instance = [[FlutterStethoPlusPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    result(FlutterMethodNotImplemented);
}

@end