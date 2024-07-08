/**
 * @Class BAPyqNaviBarView.ets
 * @Author boai
 * @DateTime 2024/7/8 11:10:40
 */
import { BACommonConstants, BANavigationBarTitle } from '@ohos/bacommonmodule'
import { router } from '@kit.ArkUI'
import { XTEasyHUD } from '@jxt/xt_hud'

@Component
export struct BAPyqNaviBarView {
  @Prop showTitle: boolean
  @Prop navBarBgColor: string

  // onBack: () => void

  //code
  build() {
    Row() {

      Row() {
        // Image($r('app.media.icon_back'))
        Image('')
          .backgroundColor(Color.Red)
          .objectFit(ImageFit.ScaleDown)
          .sourceSize({
            width: 44,
            height: 44
          })
          .aspectRatio(1)
          .width(28)
          .margin({ left: 18 })
      }
      .width("10%")
      .height(BACommonConstants.PERCENT_FULL)
      .layoutWeight(2)
      .justifyContent(FlexAlign.Start)
      .onClick(() => {
        router.back()
      })

      if (this.showTitle) {
        BANavigationBarTitle({ title: '朋友圈' })
          .width('60%')
          .height(BACommonConstants.PERCENT_FULL)
          .layoutWeight(1)
      }

      Row() {
        Image($r('app.media.icon_camera'))
          .objectFit(ImageFit.ScaleDown)
          .sourceSize({
            width: 44,
            height: 44
          })
          .aspectRatio(1)
          .width(28)
          .margin({ right: 18 })
          .onClick(() => {
            XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
          })
      }
      .width('10%')
      .height(BACommonConstants.PERCENT_FULL)
      .justifyContent(FlexAlign.End)
      .layoutWeight(2)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)
    .backgroundColor(this.navBarBgColor)
  }
}