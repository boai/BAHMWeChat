import { BACommonConstants } from '@ohos/bacommonmodule';
import { BAMineViewModel, BAMineViewArrObject, BAMineViewItem } from '../viewmodel/BAMineViewModel';

@Entry
@Component
export struct BAMinePage {
  @State message: string = '个人中心';
  scroller: Scroller = new Scroller()

  build() {

    Column() {
      List({ space: 10, initialIndex: 0 }) {
        ForEach(BAMineViewModel.datas, (item: BAMineViewArrObject, index?: number) => {
          ListItemGroup({ style: item.style }) {
            if (index == 0) {
              ListItem() {
                BATopUserView()
                  .width(BACommonConstants.PERSENT_FULL)
                  .height(160)
              }
            } else {
              ForEach(item.items, (subItem: BAMineViewItem, itemIndex?: number) => {


                ListItem() {
                  // if (index != undefined && itemIndex != undefined) {
                  //   Text("第" + (index + 1) + "个分区，" + "第" + (itemIndex + 1) + "行")
                  // }
                  BAGroupItem({
                    image: subItem.icon,
                    title: subItem.title,
                    isShowRightArrow: true
                  })
                    .width(BACommonConstants.PERSENT_FULL)
                    .height(56)
                }
              })
            }
          }
        })
      }
      .width(BACommonConstants.PERSENT_FULL)
    }
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
    .backgroundColor($r('app.color.list_background'))
  }
}

@Component
struct BAGroupItem {
  @BuilderParam image?: Resource | string
  @BuilderParam title?: string
  @BuilderParam isShowRightArrow?: boolean

  build() {
    Row() {
      Row() {
        Image(this.image)
          // .backgroundColor(Color.Orange)
          .width(28)
          .height(28)
          .margin({ left: 20 })

        Text(this.title)
          .margin({ left: 6 })
      }

      if (this.isShowRightArrow) {
        Image($r('app.media.icon_arrow_right'))
          .width(20)
          .height(20)
          .margin({ right: 16 })
      }
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct BATopUserView {
  build() {
    Row() {
      Image($r('app.media.icon_userAvatar'))
        .width(80)
        .height(80)
        .margin({ left: 20 })
        .alignSelf(ItemAlign.Center)

      Column() {
        Text("博爱")
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
        Text("微信号：boai")
          .fontSize(14)
          .fontWeight(FontWeight.Regular)
          .margin({ top: 8 })
      }
      // .backgroundColor(Color.Red)
      .width("40%")
      .margin({ left: 20, right: 12 })
      .alignItems(HorizontalAlign.Start)

      Row() {
        Image($r("app.media.icon_qrcode"))
          .width(20)
          .height(20)
          .margin({ right: 12 })

        Image($r('app.media.icon_arrow_right'))
          .width(20)
          .height(20)
          .margin({ right: 20 })
      }
      .width(90)
      .height(40)
      .justifyContent(FlexAlign.End)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }
}