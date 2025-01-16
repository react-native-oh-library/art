import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { RNC } from "./generated";

@Component
export struct RNCARTShape {
  public static readonly NAME = RNC.RNCARTShape.NAME
  public ctx!: RNComponentContext
  public tag: number = 0
  @State private descriptorWrapper: RNC.RNCARTShape.DescriptorWrapper = {} as RNC.RNCARTShape.DescriptorWrapper
  private eventEmitter: RNC.RNCARTShape.EventEmitter | undefined = undefined
  private cleanUpCallbacks: (() => void)[] = []
  @State src: PixelMap | ResourceStr| DrawableDescriptor = ''
  @State capInsets: EdgeWidths = {}
  @State isUri: boolean = false

  aboutToAppear() {
    this.eventEmitter = new RNC.RNCARTShape.EventEmitter(this.ctx.rnInstance, this.tag)
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNCARTShape.DescriptorWrapper>(this.tag)!)
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNCARTShape.DescriptorWrapper)
      }
    ))
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNCARTShape.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb())
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      Text('RNCARTShape').fontSize(20)
    }
  }
}