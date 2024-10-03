#ifdef RCT_NEW_ARCH_ENABLED
#import "Model3dView.h"

#import <react/renderer/components/RNModel3dViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNModel3dViewSpec/EventEmitters.h>
#import <react/renderer/components/RNModel3dViewSpec/Props.h>
#import <react/renderer/components/RNModel3dViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "react_native_model3d-Swift.h"
#import "Utils.h"


using namespace facebook::react;

@interface Model3dView () <RCTModel3dViewViewProtocol, Model3dViewDelegate>

@end

@implementation Model3dView {
#if TARGET_OS_VISION
  Model3DView* _view;
#else
  UIView* _view;
#endif
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<Model3dViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const Model3dViewProps>();
    _props = defaultProps;

#if TARGET_OS_VISION
    _view = [[Model3DView alloc] initWithDelegate:self];
#else
    _view = [[UIView alloc] init];
#endif

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<Model3dViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<Model3dViewProps const>(props);

#if TARGET_OS_VISION
  if (oldViewProps.source != newViewProps.source) {
    _view.source = [NSString stringWithCString:newViewProps.source.c_str() encoding:kCFStringEncodingUTF8];
  }

  if (oldViewProps.modelAspectRatio != newViewProps.modelAspectRatio) {
    _view.modelAspectRatio = [NSString stringWithCString:toString(newViewProps.modelAspectRatio).c_str() encoding:kCFStringEncodingUTF8];
  }
#endif

  [super updateProps:props oldProps:oldProps];
}

#pragma mark - Model3dViewDelegate
- (void)onLoad {
  auto eventEmitter = std::static_pointer_cast<const Model3dViewEventEmitter>(_eventEmitter);
  if (eventEmitter) {
    eventEmitter->onLoad({});
  }
}


Class<RCTComponentViewProtocol> Model3dViewCls(void)
{
  return Model3dView.class;
}


@end
#endif
