import { BACommonConstants } from '../constants/BACommonConstants'
import { Image } from '@kit.ArkGraphics3D'

@Component
export struct BANavigationBar {
  @BuilderParam title?: string | undefined
  @BuilderParam rightButtonTitle?: string
  @BuilderParam rightButtonImage?: Resource
  @BuilderParam onRightButtonClick?: () => void

  build() {
    Row() {
      Column() {
      }
      .width("20%")

      Column() {
        if (this.title != '' || this.title != undefined) {
          Text(this.title)
            .fontSize(24)
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.Center)// .backgroundColor(Color.Yellow)
            .alignSelf(ItemAlign.Center)
            .width(BACommonConstants.PERCENT_FULL)
            .height(BACommonConstants.PERCENT_FULL)
        }
      }
      .width('60%')
      .height(BACommonConstants.PERCENT_FULL)

      Row() {
        if (this.rightButtonTitle != undefined) {
          Button(this.rightButtonTitle)
            .width(44)
            .height(44)
            .margin({ right: 20 })
        } else if (this.rightButtonImage != undefined) {
          this.rightButtonImage
            // .width(44)
            // .height(44)
            // .renderMode(ImageRenderMode.Original)
            // .margin({ right: 20 })
            // .onClick(this.onRightButtonClick)
        }

      }
      .width('20%')
      .justifyContent(FlexAlign.End)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)
  }
}

