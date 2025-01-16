import {HostComponent, ViewProps} from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import {Double, WithDefault} from 'react-native/Libraries/Types/CodegenTypes';

export interface NativeProps extends ViewProps {
  name?: string;
}

export default codegenNativeComponent<NativeProps>(
  'RNCARTShape',
) as HostComponent<NativeProps>;
