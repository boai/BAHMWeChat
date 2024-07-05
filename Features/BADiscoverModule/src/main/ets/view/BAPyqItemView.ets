/**
 * @Class BAPyqItemView.ets
 * @Author boai
 * @DateTime 2024/7/4 15:52:29
 */
import { BACommonConstants } from '@ohos/bacommonmodule'
import { BAPyqItemCommentModel, BAPyqItemModel } from '../viewmodel/BAPyqViewModel'

@Entry
@Component
export struct BAPyqItemView {
  @BuilderParam itemModel: BAPyqItemModel

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
            .fontSize(14)
            .textAlign(TextAlign.Start)
            .margin({ top: 8, right: 16 })
            .textOverflow({ overflow: TextOverflow.Clip })
        }
        .alignItems(HorizontalAlign.Start)

        Row() {
          Text(this.itemModel.time)
            .fontSize(12)
            .fontColor(Color.Grey)
        }
        .width(BACommonConstants.PERCENT_FULL)
        .margin({ top: 20 })

        if (this.itemModel.comments.length > 0) {
          BAPyqCommentView({ comments: this.itemModel.comments })// .width(BACommonConstants.PERCENT_FULL)
            .margin({ top: 12, right: 20 })
        }
      }
      .width('calc(100% - 44vp - 16vp - 10vp)')
      .margin({ left: 8 })
      .alignItems(HorizontalAlign.Start)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    .alignItems(VerticalAlign.Top)
    .margin({ top: 20, bottom: 20 })
  }
}

@Component
struct BAPyqCommentView {
  @BuilderParam comments: BAPyqItemCommentModel[]

  build() {
    Column() {
      Repeat<BAPyqItemCommentModel>(this.comments)
        .each((obj: RepeatItem<BAPyqItemCommentModel>) => {
          BAPyqCommentItemView({ commentModel: obj.item })
        })
        .key((itemModel: BAPyqItemCommentModel) => itemModel.commentId.toString())
    }
    .backgroundColor(0xEEEEEE)
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct BAPyqCommentItemView {
  @BuilderParam commentModel: BAPyqItemCommentModel

  build() {
    Row() {
      Column() {
        Text(this.commentModel.userName)
          .textAlign(TextAlign.Start)
          .align(Alignment.TopStart)
      }
      // .align(Alignment.Start)
      // .flexShrink(1)

      Column() {
        Text('：' + this.commentModel.content)
          .textAlign(TextAlign.Start)
      }
      .flexShrink(1)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .borderRadius(8)
    .margin({
      top: 6,
      bottom: 6,
      left: 8,
      right: 8
    })
  }
}