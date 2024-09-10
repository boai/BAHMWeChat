import { XTEasyHUD } from '@jxt/xt_hud/src/main/ets/components/XTEasyHUD';
import { BACommonConstants } from '@ohos/bacommonmodule';
import { AppRouter, DynamicsRouter } from '@ohos/dynamicsrouter';
import { BAMineViewModel, BAMineViewArrObject, BAMineViewItem } from '../viewmodel/BAMineViewModel';

@AppRouter({name: "baminemodule/BAMinePage"})
@Entry
@Component
export struct BAMinePage {
  build() {
    Column() {
      List({ space: 10, initialIndex: 0 }) {
        ForEach(BAMineViewModel.datas, (item: BAMineViewArrObject, section?: number) => {
          ListItemGroup({ style: item.style }) {
            if (section == 0) {
              ListItem() {
                BATopUserView()
                  .width(BACommonConstants.PERCENT_FULL)
                  .height(160)
                  .onClick(() => {
                    XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
                  })
              }
            } else {
              ForEach(item.items, (subItem: BAMineViewItem, itemIndex?: number) => {
                ListItem() {
                  BAGroupItem({
                    image: subItem.icon,
                    title: subItem.title,
                    isShowRightArrow: true
                  })
                    .width(BACommonConstants.PERCENT_FULL)
                    .height(56)
                    .onClick(() => {
                      XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
                      if (subItem.title == '设置') {
                        DynamicsRouter.pushUri("baminemodule/BAMineSettingPage")
                      }
                    })
                }
              })
            }
          }
          .divider({
            strokeWidth: 1,
            // color: $r('app.color.list_divider'),
            startMargin: 60,
            endMargin: 0
          }) // 每行之间的分界线
        })
      }
      .width(BACommonConstants.PERCENT_FULL)
      // .height(BACommonConstants.PERCENT_EXCEPT_TABBAR)
      .height('calc(100% - 49vp)')
      .listDirection(Axis.Vertical) // 排列方向
      .layoutWeight(1) // 自适应占满剩余空间
      .edgeEffect(EdgeEffect.Spring)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    // .backgroundColor($r('app.color.list_background'))
  }
}

@Component
struct BAGroupItem {
  @Prop image?: Resource | string
  @Prop title?: string
  @Prop isShowRightArrow?: boolean

  build() {
    Row() {
      Row() {
        Image(this.image)// .backgroundColor(Color.Orange)
          .width(24)
          .height(24)
          .margin({ left: 20 })
          .objectFit(ImageFit.Auto)

        Text(this.title)
          .margin({ left: 12 })
      }

      if (this.isShowRightArrow) {
        Image($r('app.media.icon_arrow_right'))
          .width(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .height(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .margin({ right: 16 })
      }
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct BATopUserView {
  build() {
    Row() {
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
        .width("40%")
        .margin({ left: 20, right: 12 })
        .alignItems(HorizontalAlign.Start)
      }

      Row() {
        Image($r("app.media.icon_qrcode"))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Image($r('app.media.icon_arrow_right'))
          .width(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .height(BACommonConstants.IMAGE_WIDTH_RIGHTARROW)
          .margin({ right: 16 })
      }
      .width(80)
      .height(40)
      .justifyContent(FlexAlign.End)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .justifyContent(FlexAlign.End)
  }
}

class DividerTmp {
  strokeWidth: Length = 1
  startMargin: Length = 60
  endMargin: Length = 10
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}