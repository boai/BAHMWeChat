/**
 * @Class BAArrayUtil.ets
 * @Author boai
 * @DateTime 2024/7/4 09:37:54
 */

import { BACommonConstants } from '../constants/BACommonConstants'
import { Image } from '@kit.ArkGraphics3D'

@Component
export struct BANavigationBarTitle {
  @BuilderParam title?: string | undefined

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(BACommonConstants.FONT_SIZE_NAVI_TITLE)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)// .backgroundColor(Color.Yellow)
          .alignSelf(ItemAlign.Center)
          .width(BACommonConstants.PERCENT_FULL)
          .height(BACommonConstants.PERCENT_FULL)
      }
      .width(BACommonConstants.PERCENT_FULL)
      .height(BACommonConstants.PERCENT_FULL)
      .layoutWeight(1)
    }
  }
}

