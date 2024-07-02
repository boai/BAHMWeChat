import { BACommonConstants } from '@ohos/bacommonmodule'
import { BADiscoverViewItem } from '../viewmodel/BADiscoverViewModel'

@Component
export struct BADiscoverListItemView {
  @BuilderParam item: BADiscoverViewItem

  build() {
    Row() {
      Row() {
        Image(this.item.icon)
          .backgroundColor(Color.Yellow)
          .width(24)
          .height(24)
          .margin({ left: 16 })
        // .alignSelf(ItemAlign.Start)

        Text(this.item.title)
          .margin({ left: 20 })
      }

      Row() {
        if (this.item.rightIcon != undefined || this.item.rightIcon != null) {
          Image(this.item.rightIcon)
            .backgroundColor(Color.Yellow)
            .width(28)
            .height(28)
            .margin({ right: 16 })
        }

        Image($r('app.media.icon_arrow_right'))
          .width(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .height(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .margin({ right: 16 })
      }
    }
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}