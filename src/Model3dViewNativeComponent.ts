import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type { WithDefault } from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  source?: { uri: string };
  aspectRatio?: WithDefault<'fit' | 'fill', 'fit'>;
}

export default codegenNativeComponent<NativeProps>('Model3dView', {
  excludedPlatforms: ['android'],
});
