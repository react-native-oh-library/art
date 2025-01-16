import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { RNC } from "./generated";

@Component
export struct RNCARTSurfaceView {
  public static readonly NAME = RNC.RNCARTSurfaceView.NAME
  public ctx!: RNComponentContext
  public tag: number = 0
  @State private descriptorWrapper: RNC.RNCARTSurfaceView.DescriptorWrapper = {} as RNC.RNCARTSurfaceView.DescriptorWrapper
  private eventEmitter: RNC.RNCARTSurfaceView.EventEmitter | undefined = undefined
  private cleanUpCallbacks: (() => void)[] = []
  @State src: PixelMap | ResourceStr| DrawableDescriptor = ''
  @State capInsets: EdgeWidths = {}
  @State isUri: boolean = false

  aboutToAppear() {
    this.eventEmitter = new RNC.RNCARTSurfaceView.EventEmitter(this.ctx.rnInstance, this.tag)
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNCARTSurfaceView.DescriptorWrapper>(this.tag)!)
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNCARTSurfaceView.DescriptorWrapper)
      }
    ))
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNCARTSurfaceView.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb())
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      Text('RNCARTSurfaceView').fontSize(20)
    }
  }
}