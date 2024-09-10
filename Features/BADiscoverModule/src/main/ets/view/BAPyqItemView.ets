/**
 * @Class BAPyqItemView.ets
 * @Author boai
 * @DateTime 2024/7/4 15:52:29
 */
import { XTEasyHUD } from '@jxt/xt_hud/src/main/ets/components/XTEasyHUD'
import { BACommonConstants, BATextUtil } from '@ohos/bacommonmodule'
import { BAPyqItemCommentModel, BAPyqItemModel } from '../viewmodel/BAPyqViewModel'
import measure from '@ohos.measure';

const MAX_LINES: number = 3; // 收起时文本最大行数
const MEASURE_ELLIPSIS: string = '...'; // 省略符
const CONTENT_WIDTH: number = 300

@Entry
@Component
export struct BAPyqItemView {
  @Prop itemModel: BAPyqItemModel
  @State isShowExpandButton: boolean = true
  @State isExpand: boolean = true
  @State lastSpan: string = ''; // 最后位置的文字
  @State exceedOneLine: boolean = false; // 加上'收起'二字时超过一行需要换行
  @State title: string = ''

  onExpand(): void {
    if (!this.isShowExpandButton) {
      return
    }
    if (this.isExpand) {
      this.closeText()
    } else {
      this.expandText()
    }
  }

  // 展开文字
  expandText(): void {
    if (!this.isShowExpandButton) {
      return
    }


    this.lastSpan = "收起"
    this.isExpand = true
    this.title = this.itemModel.content
    let clipTitle: string = this.itemModel.content
    // 计算接收文字的高度
    let titleSize: SizeOptions = BATextUtil.getTextSize(this.itemModel.content, CONTENT_WIDTH, 14)

    // 计算文字加'收起'时的高度
    let limitSize: SizeOptions = BATextUtil.getTextSize(clipTitle + `${this.lastSpan}`, CONTENT_WIDTH, 14, MAX_LINES)

    // 判断接收文字高度是否等于文字加'收起'时的高度，若等于则不用另起一行显示'收起'
    if (Number(titleSize.height) === Number(limitSize.height)) {
      this.exceedOneLine = false
    } else {
      this.exceedOneLine = true
    }
  }

  // 收起文字
  closeText(): void {
    if (!this.isShowExpandButton) {
      return
    }
    // 计算接收文字的高度
    let titleSize: SizeOptions = BATextUtil.getTextSize(this.itemModel.content, CONTENT_WIDTH, 14)

    // 计算文字加'收起'时的高度
    let limitSize: SizeOptions = BATextUtil.getTextSize(this.itemModel.content, CONTENT_WIDTH, 14, MAX_LINES)

    if (Number(titleSize.height) <= Number(limitSize.height)) {
      this.title = this.itemModel.content
      this.isShowExpandButton = false
      return
    }

    let clipTitle: string = this.itemModel.content
    this.lastSpan = "展开"
    while (Number(titleSize.height) > Number(limitSize.height)) {
      this.isExpand = true
      clipTitle = clipTitle.substring(0, clipTitle.length - 1)
      titleSize = measure.measureTextSize({
        textContent: clipTitle + MEASURE_ELLIPSIS + `${this.lastSpan}}`,
        constraintWidth: CONTENT_WIDTH,
        fontSize: 14
      })
    }
    this.exceedOneLine = false
    this.title = clipTitle + MEASURE_ELLIPSIS
    this.isExpand = false
  }

  aboutToAppear(): void {
    this.onExpand()
  }

  //code
  build() {
    Row() {
      Image(this.itemModel.userIcon)
        .width(44)
        .height(44)
        .borderRadius(6)
        .margin({ left: 16 })
        // .objectFit(ImageFit.Contain)

      Column() {
        Column() {
          Text(this.itemModel.userName)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Blue)
            .onClick(() => {
              XTEasyHUD.showToast('点击了：' + this.itemModel.userName)
            })

          // Text(this.title)
          //   .fontSize(14)
          //   .textAlign(TextAlign.Start)
          //   .margin({ top: 8, right: 16 })
          //   .textOverflow({ overflow: TextOverflow.Ellipsis })
          //   .maxLines(3)

          Column() {
            Text() {
              Span(this.title)
              if (this.isShowExpandButton && !this.exceedOneLine) {
                Span(`${this.lastSpan}`)
                  .fontColor(Color.Orange)
              }
            }
            .fontSize(14)
            .textAlign(TextAlign.Start)
            .margin({ top: 8, right: 16 })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width(CONTENT_WIDTH)

            if (this.exceedOneLine) {
              Text(this.lastSpan)
                .fontSize(14)
                .width(CONTENT_WIDTH)
                .textAlign(TextAlign.End)
                .fontColor(Color.Orange)
            }
          }
          .onClick(() => {
            this.onExpand()
          })
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
  @Prop comments: BAPyqItemCommentModel[]

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
  @Prop commentModel: BAPyqItemCommentModel

  build() {
    Row() {
      Text() {
        Span(this.commentModel.userName + '：')
          .fontColor(Color.Blue)
          .fontSize(16)
          .fontStyle(FontStyle.Normal)// .decoration({ type: TextDecorationType.Underline, color: Color.Black })
          .onClick(() => {
            XTEasyHUD.showToast('点击了：' + this.commentModel.userName)
          })

        Span(this.commentModel.content)
          .fontColor(Color.Black).fontSize(14)
        // .fontStyle(FontStyle.Italic)
      }
    }
    .width(BACommonConstants.PERCENT_FULL)
    .borderRadius(8)
    .margin({
      top: 6,
      bottom: 6,
      left: 8,
      right: 8
    })
    .alignSelf(ItemAlign.Start)
  }
}