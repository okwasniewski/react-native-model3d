import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  DirectEventHandler,
  WithDefault,
} from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  source?: string;
  modelAspectRatio?: WithDefault<'fit' | 'fill', 'fit'>;
  onLoad?: DirectEventHandler<{}>;
}

export default codegenNativeComponent<NativeProps>('Model3dView', {
  excludedPlatforms: ['android'],
});
