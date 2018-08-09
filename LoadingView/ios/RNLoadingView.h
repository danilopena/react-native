
#import <UIKit/UIKit.h>
#import <React/RCTViewManager.h>

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNLoadingView : UIViewController <RCTViewManager>

@end
  
