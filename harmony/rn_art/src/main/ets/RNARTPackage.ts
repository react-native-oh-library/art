import { RNPackage } from '@rnoh/react-native-openharmony/ts';
import type {
  DescriptorWrapperFactoryByDescriptorTypeCtx,
  DescriptorWrapperFactoryByDescriptorType
} from '@rnoh/react-native-openharmony/ts';
import { RNC } from "./generated/ts"

export class RNARTPackage extends RNPackage {
  createDescriptorWrapperFactoryByDescriptorType(
    ctx: DescriptorWrapperFactoryByDescriptorTypeCtx
  ): DescriptorWrapperFactoryByDescriptorType {

    return {
      [RNC.RNCARTGroup.NAME]: (ctx) => new RNC.RNCARTGroup.DescriptorWrapper(ctx.descriptor),
      [RNC.RNCARTShape.NAME]: (ctx) => new RNC.RNCARTShape.DescriptorWrapper(ctx.descriptor),
      [RNC.RNCARTSurfaceView.NAME]: (ctx) => new RNC.RNCARTSurfaceView.DescriptorWrapper(ctx.descriptor),
      [RNC.RNCARTText.NAME]: (ctx) => new RNC.RNCARTText.DescriptorWrapper(ctx.descriptor),
    };
  }
}