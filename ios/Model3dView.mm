#ifdef RCT_NEW_ARCH_ENABLED
#import "Model3dView.h"

#import <react/renderer/components/RNModel3dViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNModel3dViewSpec/EventEmitters.h>
#import <react/renderer/components/RNModel3dViewSpec/Props.h>
#import <react/renderer/components/RNModel3dViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface Model3dView () <RCTModel3dViewViewProtocol>

@end

@implementation Model3dView {
    UIView * _view;
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

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<Model3dViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<Model3dViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> Model3dViewCls(void)
{
    return Model3dView.class;
}

@end
#endif
