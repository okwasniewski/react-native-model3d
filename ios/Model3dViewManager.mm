#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>
#import "RCTBridge.h"
#import "react_native_model3d-Swift.h"


@interface Model3dViewManager : RCTViewManager
@end

@implementation Model3dViewManager

RCT_EXPORT_MODULE(Model3dView)

- (UIView *)view
{
#if TARGET_OS_VISION
  return [[Model3DView alloc] initWithDelegate:nil];
#else
  return [[UIView alloc] init];
#endif
}

RCT_EXPORT_VIEW_PROPERTY(source, NSString)
RCT_EXPORT_VIEW_PROPERTY(aspectRatio, NSString)
RCT_EXPORT_VIEW_PROPERTY(onLoad, RCTDirectEventBlock)

@end
