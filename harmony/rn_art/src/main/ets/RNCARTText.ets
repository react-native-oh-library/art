import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { RNC } from "./generated";

@Component
export struct RNCARTText {
  public static readonly NAME = RNC.RNCARTText.NAME
  public ctx!: RNComponentContext
  public tag: number = 0
  @State private descriptorWrapper: RNC.RNCARTText.DescriptorWrapper = {} as RNC.RNCARTText.DescriptorWrapper
  private eventEmitter: RNC.RNCARTText.EventEmitter | undefined = undefined
  private cleanUpCallbacks: (() => void)[] = []
  @State src: PixelMap | ResourceStr| DrawableDescriptor = ''
  @State capInsets: EdgeWidths = {}
  @State isUri: boolean = false

  aboutToAppear() {
    this.eventEmitter = new RNC.RNCARTText.EventEmitter(this.ctx.rnInstance, this.tag)
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNCARTText.DescriptorWrapper>(this.tag)!)
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNCARTText.DescriptorWrapper)
      }
    ))
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNCARTText.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb())
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      Text('RNCARTText').fontSize(20)
    }
  }
}