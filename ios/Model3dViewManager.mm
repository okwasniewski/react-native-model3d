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
  return [[Model3DView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(source, RCTImageSource)
RCT_EXPORT_VIEW_PROPERTY(aspectRatio, NSString)

@end
