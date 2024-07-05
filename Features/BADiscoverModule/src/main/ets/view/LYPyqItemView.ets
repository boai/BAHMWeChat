/**
 * @Class LYPyqItemView.ets
 * @Author boai
 * @DateTime 2024/7/4 15:52:29
 */
import { BACommonConstants } from '@ohos/bacommonmodule'
import { LYPyqItemModel } from '../viewmodel/LYPyqViewModel'

@Entry
@Component
export struct LYPyqItemView {
  @BuilderParam itemModel: LYPyqItemModel

  //code
  build() {
    Row() {
      Image(this.itemModel.userIcon)
        .width(44)
        .height(44)
        .borderRadius(6)
        .margin({ left: 16 })

      Column() {
        Column() {
          Text(this.itemModel.userName)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Blue)

          Text(this.itemModel.content)
            .textAlign(TextAlign.Start)
            .margin({ top: 8, right: 16 })
            .textOverflow({ overflow: TextOverflow.Clip })
        }
        .alignItems(HorizontalAlign.Start)

        Row() {
          Text(this.itemModel.time)
        }
        .width(BACommonConstants.PERCENT_FULL)
        .margin({top: 20})
      }
      .width('calc(100% - 44vp - 16vp - 10vp)')
      .margin({ left: 8 })
      .alignItems(HorizontalAlign.Start)
      // .backgroundColor(Color.Yellow)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    // .height(BACommonConstants.PERCENT_FULL)
    .alignItems(VerticalAlign.Top)
    .margin({top: 20, bottom: 20})
  }
}